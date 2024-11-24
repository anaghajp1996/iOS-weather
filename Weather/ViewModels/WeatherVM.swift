//
//  WeatherVM.swift
//  Weather
//
//  Created by Anagha K J on 23/11/24.
//

import Foundation

protocol WeatherProtocol {
    func getWeather(for city: String) async throws -> WeatherResponse?
    func setUDCity(_ city: String)
    func getUDCity() -> String
}

class WeatherViewModel: WeatherProtocol {

    func setUDCity(_ city: String) {
        UserDefaults.standard.set(city, forKey: Constants.cityNameKey)
    }
    
    func getUDCity() -> String {
        return UserDefaults.standard.string(forKey: Constants.cityNameKey) ?? ""
    }
    
    func getWeather(for city: String) async throws -> WeatherResponse? {
        let networking = Networking()
        if let data = try await networking.getRequest(url: "\(Constants.endpoint)\(Constants.currenWeatherAPI)", queryItems: [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "key", value: Keys.apiKey)
        ]) {
            let result: WeatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
            return result
        }
        return nil
    }
}
