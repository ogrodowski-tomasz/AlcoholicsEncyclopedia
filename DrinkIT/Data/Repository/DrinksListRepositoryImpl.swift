//
//  DrinksListRepositoryImpl.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import Foundation

// Converting from data structure in API to our own.
struct DrinksListRepositoryImpl: DrinksRepository {
    var dataSource: DrinksDataSource
    func getDrinks(for ingredient: SingleIngredient) async throws -> Result<DrinksContainer, RequestError> {
        let result = try await dataSource.fetchDrinks(for: ingredient)
        switch result {
        case .success(let retrievedDrinks):
            let apiBridgeToModel = retrievedDrinks.drinks.map { item in
                SingleDrink(name: item.strDrink, imageURL: item.imageURL, id: item.idDrink)
            }
            return .success(DrinksContainer(drinksContainer: apiBridgeToModel))
        case .failure(let error):
            return .failure(error)
        }
    }
}
