//
//  GetImage.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 10/06/2022.
//

import Foundation
import UIKit

protocol GetImage {
    var repository: ImageRepository { get }
    func execute(url: URL, forName name: String) async throws -> UIImage
}

struct GetImageUseCase: GetImage {
    var repository: ImageRepository

    func execute(url: URL, forName name: String) async throws -> UIImage {
        do {
            let image = try await repository.getImage(url: url, forName: name)
            return image
        } catch {
            throw RequestError.decode
        }
    }
}
