//
//  IngredientsListDataSource.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 07/06/2022.
//

import Foundation
import SwiftUI

// Fetching data about all avalible ingredients
protocol IngredientsDataSource {
    func fetchIngredients() async throws -> Result<IngredientsListAPIEntity, RequestError>
}


