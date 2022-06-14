//
//  DrinkDetailsDataSource.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import Foundation

// Fetching data about drink's details
protocol DrinkDetailsDataSource {
    func fetchDrinkDetails(for drinkID: String) async throws -> Result<DrinkDetailsAPIEntity, RequestError>
}

