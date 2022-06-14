//
//  ImageDataSource.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import Foundation

// Fetching image data
protocol ImageDataSource {
    func fetchImage(url: URL, withName name: String) async throws -> Data
}
