//
//  IngredientDetailsAPIEntity.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 08/06/2022.
//

import Foundation

// How result looks on API

struct IngredientDetailsContainerAPI: Decodable {
    let ingredients: [IngredientDetails]
}

extension IngredientDetailsContainerAPI {

    struct IngredientDetails: Decodable {
        let idIngredient: String
        let strIngredient: String
        let strDescription: String?
        let strAlcohol: String
    }
    
}
