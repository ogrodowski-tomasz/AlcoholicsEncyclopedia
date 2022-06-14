//
//  DrinksContainerAPIImpl.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import Foundation

struct DrinksContainerAPIImpl: DrinksDataSource {
    func fetchDrinks(for ingredient: SingleIngredient) async throws -> Result<DrinksListAPIEntity, RequestError> {
        let result = try await NetworkingManager.fetchDatafromAPI(for: .drinks, ofType: DrinksListAPIEntity.self, inquiry: ingredient.name)
        switch result {
        case .success(let retrievedDrinks):
            return .success(retrievedDrinks)
        case .failure(let error):
            return .failure(error)
        }
    }
}
