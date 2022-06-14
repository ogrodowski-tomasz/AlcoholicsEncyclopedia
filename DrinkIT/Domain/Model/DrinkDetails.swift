//
//  DrinkDetails.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import Foundation

struct DrinkDetails: Decodable {
    let id: String
    let name: String
    let category: String
    let alcoholic: String
    let glass: String
    let instructions: String
    let imageImage: String

    let ingredients: [String]
    let measurments: [String]
}
