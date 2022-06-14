//
//  NetworkManager.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 09/06/2022.
//

import Foundation

class NetworkingManager {

    static func fetchDatafromAPI<T: Decodable>(for apiCall: APICall, ofType type: T.Type, inquiry: String) async throws -> Result<T, RequestError> {
        
        let url = Endpoint.url(for: apiCall, inquiry: inquiry)

        do {
            let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
                        }
                        switch response.statusCode {
                        case 200...299:
                            guard let decodedResponse = try? JSONDecoder().decode(type, from: data) else {
                                return .failure(.decode)
                            }
                            return .success(decodedResponse)
                        case 401:
                            return .failure(.unauthorized)
                        default:
                            return .failure(.unexpectedStatusCode)
                        }
        } catch {
            return .failure(.unknown)
        }
    }

}

