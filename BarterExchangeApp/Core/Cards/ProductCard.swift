//
//  ProductCard.swift
//  BarterExchangeApp
//
//  Created by Pavel Vyaltsev on 31.01.2024.
//

import Foundation
import SwiftUI

struct ProductCard: View {
    let product: Product

    var body: some View {
        VStack(spacing: 8) {
            ProductImageCarouselView(images: product.images)
                .frame(width: 177, height: 193)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(product.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("Москва, Новослободская")
                        .foregroundStyle(.gray)
                        .font(.footnote)
                    Text("5 марта")
                        .foregroundStyle(.gray)
                        .font(.footnote)
                }
                Spacer()
            }
        }.frame(width: 177, height: 260)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[5])
    }
}
