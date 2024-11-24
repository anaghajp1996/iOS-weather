//
//  Condition.swift
//  Weather
//
//  Created by Anagha K J on 23/11/24.
//

import SwiftUI

struct ConditionView: View {
    var title: String
    var value: String
    private let titleFont = UIFont(name: Poppins.medium, size: 12)!
    private let valueFont = UIFont(name: Poppins.medium, size: 15)!

    var body: some View {
        VStack {
            Text(title)
                .font(.custom(Poppins.medium, size: 12))
                .lineSpacing(18 - titleFont.lineHeight)
            Text(value)
                .font(.custom(Poppins.medium, size: 15))
                .lineSpacing(22.5 - valueFont.lineHeight)
        }
        .foregroundStyle(Color.textGray)
    }
}

#Preview {
    ConditionView(title: "humidity", value: "20")
}
