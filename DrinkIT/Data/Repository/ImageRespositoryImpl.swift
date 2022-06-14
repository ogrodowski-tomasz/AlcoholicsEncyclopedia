//
//  ImageRespositoryImpl.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 10/06/2022.
//

import Foundation
import UIKit

struct ImageRespositoryImpl: ImageRepository {

    var dataSource: ImageDataSource

    func getImage(url: URL, forName name: String) async throws -> UIImage {
        do {
            let imageData = try await dataSource.fetchImage(url: url, withName: name)
            guard let image = UIImage(data: imageData) else {
                throw RequestError.decode
            }
            return image
        } catch {
            throw RequestError.noResponse
        }
    }
}
