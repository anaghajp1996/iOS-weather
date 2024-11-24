//
//  WeatherView.swift
//  Weather
//
//  Created by Anagha K J on 23/11/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: WeatherResponse
    var body: some View {
        VStack {
            if weather.weather?.condition?.icon != nil {
                AsyncImage(url: URL(string: "https:" + (weather.weather?.condition?.icon)!)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 120, height: 120)
            }
            if weather.location?.cityName != nil {
                HStack {
                    Text((weather.location?.cityName)!)
                        .font(.custom(Poppins.semiBold, size: 30))
                    Image(systemName: "location.fill")
                        .foregroundStyle(.black)
                }
            }
            if weather.weather?.temperature != nil {
                Text("\(weather.weather!.temperature!, specifier: "%.2f")°")
                    .font(.custom(Poppins.medium, size: 70))
            }
            HStack {
                if let humidity = weather.weather?.humidity {
                    ConditionView(title: "Humidity", value: "\(humidity)%")
                        .padding()
                }
                if let uvIndex = weather.weather?.uvIndex {
                    ConditionView(title: "UV", value: "\(uvIndex)")
                        .padding()
                }
                if let text = weather.weather?.condition?.text {
                    ConditionView(title: "Feels Like", value: text)
                        .padding()
                }
            }
            .padding()
            .background(Color.backgroundGray)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

//#Preview {
//    WeatherView()
//}
