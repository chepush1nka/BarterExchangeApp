//
//  ProfilePreview.swift
//  BarterExchangeApp
//
//  Created by Pavel Vyaltsev on 18.04.2024.
//

import SwiftUI

struct MainButton: View {
    private let label: String

    init(label: String) {
        self.label = label
    }

    var body: some View {
        VStack {
            Button {

            } label: {
                Text(label)
            }
            .frame(minWidth: 0,
                               maxWidth: .infinity)
            .frame(height: 56)
            .background(Color(red: 217/255, green: 247/255, blue: 23/255))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .foregroundStyle(.black)
            .padding(.horizontal)
        }
    }
}

#Preview {
    MainButton(label: "Предложить обмен")
}
