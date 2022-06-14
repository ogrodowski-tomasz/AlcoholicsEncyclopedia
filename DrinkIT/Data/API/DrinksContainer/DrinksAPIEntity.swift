//
//  DrinksAPIEntity.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import Foundation

// How result looks on API

struct DrinksListAPIEntity: Decodable {
    let drinks: [DrinkAPIEntity]
}

extension DrinksListAPIEntity {
    struct DrinkAPIEntity: Decodable {
        let strDrink: String
        let strDrinkThumb: String
        let idDrink: String

        var imageURL: URL {
            // Force-unwrapping because we are not creating URL. We are given explicit url
            return URL(string: strDrinkThumb)!
        }
    }
}
