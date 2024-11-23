//
//  Networking.swift
//  Weather
//
//  Created by Anagha K J on 23/11/24.
//

import Foundation

class Networking {

    func getRequest(url: String, queryItems: [URLQueryItem]) async throws -> Data? {
        guard var urlComponents = URLComponents(string: url) else {
            return nil
        }
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw URLError(.badServerResponse)
        }
    }
}
