//
//  DrinkDetailsRepository.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import Foundation

protocol DrinkDetailsRepository {
    var dataSource: DrinkDetailsDataSource { get }
    func getDrinkDetails(for drinkID: String) async throws -> Result<DrinkDetails, RequestError>
}
