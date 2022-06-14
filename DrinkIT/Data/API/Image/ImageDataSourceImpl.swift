//
//  ImageDataSourceImpl.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 08/06/2022.
//

import Foundation
import UIKit

struct ImageDataSourceImpl: ImageDataSource {

    // If there is any data for certain image in File Manager - fetch it from there. Elsewhere download it from API.
    func fetchImage(url: URL, withName name: String) async throws -> Data {
        if let imageDataFromFileManager = await getImageDataFromFileManager(forName: name) {
            print("Fetching image data for \(name) from FileManager")
            return imageDataFromFileManager
        } else {
            let dataFromAPI = try await getImageDataFromAPI(url: url)
            print("URL Called: \(url)")
            saveImageToFileManager(imageData: dataFromAPI, imageName: name)
            return dataFromAPI
        }
    }

    private func getImageDataFromFileManager(forName name: String) async -> Data? {
        if
            let url = getURLForImage(imageName: name, folderName: "images"),
            FileManager.default.fileExists(atPath: url.path) {
            let data = try? Data(contentsOf: url)
            return data
        }
        return nil
    }

    private func getImageDataFromAPI(url: URL) async throws -> Data {

        guard let (data, response) = try? await URLSession.shared.data(from: url) else {
            throw APIServiceError.requestError
        }

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIServiceError.statusNotOK
        }

        return data
    }

    private func saveImageToFileManager(imageData: Data, folderName: String = "images", imageName: String) {
        /// Create folder if it doesn't already exist
        createFolderIfNeeded(folderName: folderName)

        /// We cannot save an UIImage into FileManager, but we can save data of this image.
        /// In order to do that, we have to convert this image into data
        guard let url = getURLForImage(imageName: imageName, folderName: folderName)
        else { return }

        do {
            try imageData.write(to: url)
        } catch let error {
            print("Error saving image \(imageName) to FileManager: \(error.localizedDescription)")
        }
    }

    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch {
                print("Error creating directory. Folder's name: \(folderName). \(error.localizedDescription)")
            }
        }
    }

    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(folderName)
    }

    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else {
            return nil
        }
        return folderURL.appendingPathComponent(imageName + ".png")
    }

}
