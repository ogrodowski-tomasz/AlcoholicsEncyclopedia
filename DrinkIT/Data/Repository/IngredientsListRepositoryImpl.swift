//
//  IngredientsListRepositoryImpl.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 07/06/2022.
//

import Foundation

// Converting from data structure in API to our own.
struct IngredientsListRepositoryImpl: IngredientsRepository {
    var dataSource: IngredientsDataSource
    func getIngredients() async throws -> Result<IngredientsContainer, RequestError> {
        let result = try await dataSource.fetchIngredients()
        switch result {
        case .success(let retrievedIngredients):
            let apiBridgeToModel = retrievedIngredients.drinks.map { item in
                SingleIngredient(name: item.strIngredient1)
            }
            return .success(IngredientsContainer(ingredientsContainer: apiBridgeToModel))
        case .failure(let error):
            return .failure(error)
        }
    }
}
