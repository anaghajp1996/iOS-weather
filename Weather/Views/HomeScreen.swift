//
//  HomeScreen.swift
//  Weather
//
//  Created by Anagha K J on 23/11/24.
//

import SwiftUI

struct HomeScreen: View {
    @State var searchedCity = ""
    @State var weather: WeatherResponse?
    @State var loading = true
    @State var isDefaultCityEmpty = true
    @State var isSearching = false
    @FocusState var isSearchInFocus: Bool
    let weatherVM = WeatherViewModel()
    @State var searchedWeather: WeatherResponse?
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                TextField("Search Location", text: $searchedCity)
                    .focused($isSearchInFocus)
                    .font(.custom(Poppins.regular, size: 20))
                    .onSubmit {
                        isSearching = true
                        Task {
                            searchedWeather = try await weatherVM.getWeather(for: searchedCity)
                        }
                    }
                Image("search_24px")
            }
            .padding()
            .background(Color.backgroundGray)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            Spacer()
            if isSearching {
                if searchedWeather?.location != nil {
                    SearchScreen(searchedWeather: searchedWeather) {
                        isSearching = false
                        weather = searchedWeather
                        weatherVM.setUDCity(searchedCity)
                        searchedCity = ""
                    }
                } else {
                    VStack {
                        Spacer()
                        Text("Could not find the what you're looking for.")
                            .font(.custom(Poppins.semiBold, size: 18))
                        Spacer()
                    }
                }
            } else {
                if loading {
                    ProgressView()
                } else {
                    if isDefaultCityEmpty {
                        EmptyCityState(title: "No City Selected", value: "Please Search For A City")
                    } else {
                        if weather != nil {
                            WeatherView(weather: weather!)
                        } else {
                            EmptyCityState(title: "Something went wrong.", value: "Please Search For A City")
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
        .task {
            do {
                let cityName = weatherVM.getUDCity()
                if cityName.isEmpty {
                    isDefaultCityEmpty = true
                } else {
                    isDefaultCityEmpty = false
                    weather = try await weatherVM.getWeather(for: cityName)
                }
                loading = false
            } catch {
                loading = false
            }
        }
    }
}

#Preview {
    HomeScreen()
}
