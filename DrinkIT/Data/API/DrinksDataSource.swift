//
//  DrinksDataSource.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import Foundation

// Fetching data about group of drinks
protocol DrinksDataSource {
    func fetchDrinks(for ingredient: SingleIngredient) async throws -> Result<DrinksListAPIEntity, RequestError>
}
