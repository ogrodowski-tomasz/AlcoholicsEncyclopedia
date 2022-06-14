//
//  GetDrinks.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import Foundation

protocol GetDrinks {
    var repository: DrinksRepository { get }
    func execute(for ingredient: SingleIngredient) async -> Result<DrinksContainer, RequestError>
}

struct GetDrinksUseCase: GetDrinks {
    var repository: DrinksRepository

    func execute(for ingredient: SingleIngredient) async -> Result<DrinksContainer, RequestError> {
        do {
            let result = try await repository.getDrinks(for: ingredient)
            let returned = try result.get()
            return .success(returned)
        } catch {
            return .failure(.decode)
        }
    }


}
