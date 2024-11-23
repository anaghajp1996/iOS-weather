//
//  Weather.swift
//  Weather
//
//  Created by Anagha K J on 23/11/24.
//

struct WeatherResponse: Decodable {
    var weather: Weather?
    var location: Location?
    
    enum CodingKeys: String, CodingKey {
        case weather = "current"
        case location
    }
}

struct Weather: Decodable {
    var temperature: Double?
    var humidity: Int?
    var uvIndex: Double?
    var feelsLike: Double?
    var condition: Condition?
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp_c"
        case humidity
        case uvIndex = "uv"
        case feelsLike = "feelslike_c"
        case condition
    }
}

struct Location: Decodable {
    var cityName: String?
    
    enum CodingKeys: String, CodingKey {
        case cityName = "name"
    }
}

struct Condition: Decodable {
    var icon: String?
    var text: String?
}
