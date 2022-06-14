//
//  DrinkDetailsRepositoryImpl.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import Foundation

// Converting data from API entity into our created App entity
struct DrinkDetailsRepositoryImpl: DrinkDetailsRepository {
    var dataSource: DrinkDetailsDataSource
    func getDrinkDetails(for drinkID: String) async throws -> Result<DrinkDetails, RequestError> {
        let result = try await dataSource.fetchDrinkDetails(for: drinkID)
        switch result {
        case .success(let detailsFromAPI):
            let apiBridgeToModel = detailsFromAPI.drinks.map { item in
                DrinkDetails(
                    id: item.idDrink,
                    name: item.strDrink,
                    category: item.strCategory,
                    alcoholic: item.strAlcoholic,
                    glass: item.strGlass,
                    instructions: item.strInstructions,
                    imageImage: item.strDrinkThumb,
                    ingredients: item.ingredients.compactMap { $0 },
                    measurments: item.measures.compactMap { $0 }
                )
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
