//
//  GetDrinkDetails.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 14/06/2022.
//

import Foundation

protocol GetDrinkDetails {
    var repository: DrinkDetailsRepository { get }
    func execute(drinkID: String) async -> Result<DrinkDetails, UseCaseError>
}

struct GetDrinkDetailsUseCase: GetDrinkDetails {
    var repository: DrinkDetailsRepository
    func execute(drinkID: String) async -> Result<DrinkDetails, UseCaseError> {
        do {
            let result = try await repository.getDrinkDetails(for: drinkID)
            let returned = try result.get()
            return .success(returned)
        } catch {
            return .failure(.networkError)
        }
    }
}
