//
//  IngredientDetailsDataSource.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import Foundation

// Fetching data about ingredient details
protocol IngredientDetailsDataSource {
    func fetchIngredientDetails(ingredient: SingleIngredient) async throws -> Result<IngredientDetailsContainerAPI, RequestError>
}
