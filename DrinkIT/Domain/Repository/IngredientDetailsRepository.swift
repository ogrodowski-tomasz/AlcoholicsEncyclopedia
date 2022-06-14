//
//  IngredientDetailsRepository.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 08/06/2022.
//

import Foundation

protocol IngredientDetailsRepository {
    func getIngredientDetails(ingredient: SingleIngredient) async throws -> Result<IngredientDetails, RequestError>
}
