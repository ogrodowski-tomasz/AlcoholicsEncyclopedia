//
//  Endpoint.swift
//  DrinkingApp
//
//  Created by Tomasz Ogrodowski on 08/06/2022.
//

import Foundation


// https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list LISTA WSZYSTKICH SKŁADNIKÓW
// https://www.thecocktaildb.com/api/json/v1/1/search.php?i=vodka SZCZEGÓŁY SKŁADNIKA
// https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin LISTA DRINKÓW Z KONKRETNYM SKŁADNIKIEM
// https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=11007  SZCZEGÓŁY DRINKA
// https://www.thecocktaildb.com/images/ingredients/gin.png ZDJĘCIE SKŁADNIKA
// https://www.thecocktaildb.com/images/media/drink/rrtssw1472668972.jpg // PRZYKLADOWE ZDJECIE DRINKA

enum APICall: String {
    case ingredients = "/api/json/v1/1/list.php"
    case ingredientDetails = "/api/json/v1/1/search.php"
    case drinks = "/api/json/v1/1/filter.php"
    case drinkDetails = "/api/json/v1/1/lookup.php"
    case image = "/images/ingredients/"
}

struct Endpoint {

    static func url(for apiCall: APICall, inquiry: String) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "thecocktaildb.com"
        components.path = apiCall.rawValue

        var queryItems: [URLQueryItem] = []

        switch apiCall {
        case .image:
            components.path += "\(inquiry).png"
        default:
            queryItems.append(URLQueryItem(name: "i", value: inquiry))
        }

        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL compnenets: \(components)")
        }
        return url
    }
}



