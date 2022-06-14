//
//  GetIngredientDetails.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 08/06/2022.
//

import Foundation

protocol GetIngredientDetails {
    var repository: IngredientDetailsRepository { get }
    func execute(ingredient: SingleIngredient) async -> Result<IngredientDetails, UseCaseError>
}

struct GetIngredientDetailsUseCase: GetIngredientDetails {

    var repository: IngredientDetailsRepository

    func execute(ingredient: SingleIngredient) async -> Result<IngredientDetails, UseCaseError> {
        do {
            let result = try await repository.getIngredientDetails(ingredient: ingredient)
            let returned = try result.get()
            return .success(returned)
        } catch {
            return .failure(.networkError)
        }
    }

}
