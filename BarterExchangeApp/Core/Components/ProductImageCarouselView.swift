//
//  ProductImageCarouselView.swift
//  BarterExchangeApp
//
//  Created by Pavel Vyaltsev on 07.04.2024.
//

import SwiftUI

struct ProductImageCarouselView: View {
    let images: [String]

    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ProductImageCarouselView(images: productList[5].images)
}
