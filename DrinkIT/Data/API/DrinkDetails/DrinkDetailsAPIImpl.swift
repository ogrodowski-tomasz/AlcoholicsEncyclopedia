//
//  DrinkDetailsAPIImpl.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import Foundation

struct DrinkDetailsAPIImpl: DrinkDetailsDataSource {
    func fetchDrinkDetails(for drinkID: String) async throws -> Result<DrinkDetailsAPIEntity, RequestError> {
        let result = try await NetworkingManager.fetchDatafromAPI(for: .drinkDetails, ofType: DrinkDetailsAPIEntity.self, inquiry: drinkID)

        switch result {
        case .success(let retrievedDrinkDetails):
            return .success(retrievedDrinkDetails)
        case .failure(let error):
            return .failure(error)
        }
    }
}
