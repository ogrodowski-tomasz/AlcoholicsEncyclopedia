//
//  DrinksRepository.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import Foundation

protocol DrinksRepository {
    var dataSource: DrinksDataSource { get }
    func getDrinks(for ingredient: SingleIngredient) async throws -> Result<DrinksContainer, RequestError>
}
