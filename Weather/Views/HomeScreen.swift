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
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                TextField("Search Location", text: $searchedCity)
                    .font(.custom("Poppins-Regular", size: 20))
                Image("search_24px")
            }
            .padding()
            .background(Color.backgroundGray)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            Spacer()
            if loading {
                ProgressView()
            } else {
                WeatherView(weather: weather!)
            }
            Spacer()
        }
        .padding()
        .task {
            do {
                weather = try await WeatherViewModel().getWeather(for: "San Jose")
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
