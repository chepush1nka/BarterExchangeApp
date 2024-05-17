//
//  ProductDetailView.swift
//  BarterExchangeApp
//
//  Created by Pavel Vyaltsev on 07.04.2024.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        ScrollView {
            ProductImageCarouselView(images: product.images)
                .frame(height: 394)
            VStack(alignment: .leading, spacing: 8) {
                Text(product.title)
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.bottom)
                Text("Описание")
                    .font(.headline)
                    .foregroundStyle(.gray)
                Text(product.description)
                    .padding(.bottom)
                Text("Характеристики")
                    .font(.headline)
                    .foregroundStyle(.gray)
                HStack {
                    Text("Вид товара:")
                        .font(.headline)
                        .foregroundStyle(.gray)
                    Text(product.category.toString())
                        .font(.headline)
                        .fontWeight(.regular)
                }
                HStack {
                    Text("Состояние товара:")
                        .font(.headline)
                        .foregroundStyle(.gray)
                    Text(product.condition.rawValue)
                        .font(.headline)
                        .fontWeight(.regular)
                }
                .padding(.bottom)

                Text("Владелец")
                    .font(.headline)
                    .foregroundStyle(.gray)

                HStack {
                    Image("user")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 71, height: 71)
                        .clipShape(Circle())
                        .padding(.trailing)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Александр")
                            .font(.title3)
                            .frame(width: 250, alignment: .leading)
                        Text("5.0 ☆ 60 Отзывов")
                        Text("3 объявления")
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .overlay(alignment: .bottom) {
            MainButton(label: "Предложить обмен")
        }
    }
}

#Preview {
    ProductDetailView(product: productList[5])
}
