//
//  Drinks.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import Foundation

typealias SingleDrink = DrinksContainer.Drink

struct DrinksContainer: Decodable {
    let drinksContainer: [Drink]
}

extension DrinksContainer {
    struct Drink: Hashable, Codable {
        let name: String
        let imageURL: URL
        let id: String
    }
}
