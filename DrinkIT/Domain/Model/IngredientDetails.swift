//
//  IngredientDetails.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 08/06/2022.
//

import Foundation

struct IngredientDetails {
    let id: String
    let name: String
    let description: String?
    let alcohol: String

    var isAlcoholic: Bool {
        if alcohol == "Yes" {
            return true
        } else {
            return false
        }
    }

    var unwrappedDescrption: String {
        return description ?? "Description not provided"
    }
}

