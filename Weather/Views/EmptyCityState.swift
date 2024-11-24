//
//  EmptyCityState.swift
//  Weather
//
//  Created by Anagha K J on 23/11/24.
//

import SwiftUI

struct EmptyCityState: View {
    var title: String
    var value: String
    private let titleFont = UIFont(name: Poppins.semiBold, size: 30)!
    private let valueFont = UIFont(name: Poppins.semiBold, size: 15)!
    var body: some View {
        VStack {
            Text(title)
                .font(.custom(Poppins.semiBold, size: 30))
                .lineSpacing(45 - titleFont.lineHeight)
            Text(value)
                .font(.custom(Poppins.semiBold, size: 15))
                .lineSpacing(22.5 - titleFont.lineHeight)
        }
    }
}

