//
//  GetIngredients.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 07/06/2022.
//

import Foundation

enum UseCaseError: Error {
    case networkError, decodingError
}

protocol GetIngredients {
    var repository: IngredientsRepository { get }
    func execute() async -> Result<IngredientsContainer, RequestError>
}

struct GetIngredientsUseCase: GetIngredients {

    var repository: IngredientsRepository

    func execute() async -> Result<IngredientsContainer, RequestError> {
        do {
            let result = try await repository.getIngredients()
            let returned = try result.get()
            return .success(returned)
        } catch {
            return .failure(.unknown)
        }
    }

}
