//
//  IngredientsAPIEntity.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 07/06/2022.
//

import Foundation

// How result looks on API

struct IngredientsListAPIEntity: Codable {
    let drinks: [IngredientAPIEntity]
}

extension IngredientsListAPIEntity {
    struct IngredientAPIEntity: Codable {
        let strIngredient1: String
    }
}
