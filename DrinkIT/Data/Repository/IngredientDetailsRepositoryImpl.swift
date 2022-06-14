//
//  IngredientDetailsRepositoryImpl.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 08/06/2022.
//

import Foundation

// Converting data from API entity into our created App entity
struct IngredientDetailsRepositoryImpl: IngredientDetailsRepository {
    var dataSource: IngredientDetailsDataSource

    func getIngredientDetails(ingredient: SingleIngredient) async throws -> Result<IngredientDetails, RequestError> {
        let result = try await dataSource.fetchIngredientDetails(ingredient: ingredient)
        switch result {
        case .success(let dataRetrievedFromAPI):
            let apiBridgeToModel = dataRetrievedFromAPI.ingredients.map { item in
                IngredientDetails(id: item.idIngredient, name: item.strIngredient, description: item.strDescription, alcohol: item.strAlcohol)
            }
            if let details = apiBridgeToModel.first {
                return .success(details)
            } else {
                return .failure(.noResponse)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
    
}
