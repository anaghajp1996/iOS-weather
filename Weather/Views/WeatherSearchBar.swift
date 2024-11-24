//
//  WeatherSearchBar.swift
//  Weather
//
//  Created by Anagha K J on 23/11/24.
//

import SwiftUI

struct WeatherSearchBar: View {
    @FocusState var isSearchInFocus: Bool
    @Binding var searchedCity: String
    var onSubmit: () -> Void
    var body: some View {
        VStack {
            HStack {
                TextField("Search Location", text: $searchedCity)
                    .focused($isSearchInFocus)
                    .font(.custom(Poppins.regular, size: 20))
                    .onSubmit {
                        onSubmit()
                    }
                Image("search_24px")
            }
            .padding()
            .background(Color.backgroundGray)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }

    }
}
