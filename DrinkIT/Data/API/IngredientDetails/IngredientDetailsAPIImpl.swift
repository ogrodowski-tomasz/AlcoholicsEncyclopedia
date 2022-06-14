//
//  IngredientDetailsAPIImpl.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 08/06/2022.
//

import Foundation

struct IngredientDetailsAPIImpl: IngredientDetailsDataSource {

    func fetchIngredientDetails(ingredient: SingleIngredient) async throws -> Result<IngredientDetailsContainerAPI, RequestError> {
        let result = try await NetworkingManager.fetchDatafromAPI(for: .ingredientDetails, ofType: IngredientDetailsContainerAPI.self, inquiry: ingredient.name)

        switch result {
        case .success(let retrievedIngredientDetails):
            return .success(retrievedIngredientDetails)
        case .failure(let error):
            return .failure(error)
        }
    }

}
