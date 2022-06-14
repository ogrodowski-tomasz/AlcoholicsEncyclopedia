//
//  ImageRepository.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 10/06/2022.
//

import Foundation
import UIKit

// Getting image of ingredient, drink or maybe somethin more...?
protocol ImageRepository {
    func getImage(url: URL, forName name: String) async throws -> UIImage
}
