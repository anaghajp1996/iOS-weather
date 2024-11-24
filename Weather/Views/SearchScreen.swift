//
//  SearchScreen.swift
//  Weather
//
//  Created by Anagha K J on 23/11/24.
//

import SwiftUI

struct SearchScreen: View {
    var searchedWeather: WeatherResponse?
    var onCitySelected: () -> Void
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack {
                    if let cityName = searchedWeather?.location?.cityName {
                        HStack {
                            Text(cityName)
                                .font(.custom(Poppins.semiBold, size: 20))
                            Image(systemName: "location.fill")
                                .foregroundStyle(.black)
                        }
                    }
                    if let temp = searchedWeather?.weather?.temperature {
                        Text("\(temp, specifier: "%.2f")°")
                            .font(.custom(Poppins.medium, size: 60))
                    }
                }
                Spacer()
                if let icon = searchedWeather?.weather?.condition?.icon {
                    AsyncImage(url: URL(string: "https:" + icon)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 80, height: 80)
                }
            }
            .padding()
            .background(Color.backgroundGray)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .onTapGesture {
                onCitySelected()
            }
            Spacer()
        }
    }
}
