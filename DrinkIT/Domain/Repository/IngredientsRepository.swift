//
//  IngredientsListRepository.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 07/06/2022.
//

import Foundation

protocol IngredientsRepository {
    var dataSource: IngredientsDataSource { get }
    func getIngredients() async throws -> Result<IngredientsContainer, RequestError>
}
