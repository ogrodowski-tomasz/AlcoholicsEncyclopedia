//
//  IngredientAPIImpl.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 07/06/2022.
//

import Foundation

enum APIServiceError: Error {
    case badURL, requestError, decodingError, statusNotOK
}

struct IngredientsContainerAPIImpl: IngredientsDataSource {

    func fetchIngredients() async throws -> Result<IngredientsListAPIEntity, RequestError> {

        let result = try await NetworkingManager.fetchDatafromAPI(for: .ingredients, ofType: IngredientsListAPIEntity.self, inquiry: "list")
        switch result {
        case .success(let retrievedIngredients):
            // Switching from names from API result to names we want to use in app
            return .success(retrievedIngredients)
        case .failure(let error):
            return .failure(error)
        }
    }
}

