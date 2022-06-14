//
//  IngredientList.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 07/06/2022.
//

import Foundation

struct IngredientsContainer: Codable {
    let ingredientsContainer: [Ingredient]
}

extension IngredientsContainer {
    struct Ingredient: Hashable, Codable {
        let name: String

        var urlFriendlyName: String {
            if name.contains(" ") {
                return name.replacingOccurrences(of: " ", with: "%20")
            } else {
                return name
            }
        }

        var imageURL: URL {
            return Endpoint.url(for: .image, inquiry: name)
        }
        
    }
}
