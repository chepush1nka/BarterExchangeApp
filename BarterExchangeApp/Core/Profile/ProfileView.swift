//
//  Profile.swift
//  BarterExchangeApp
//
//  Created by Pavel Vyaltsev on 17.04.2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileFilterViewModel = .sells
    @Namespace var animation

    private var column = [GridItem(.adaptive(minimum: 160), spacing: 20)]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
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
                            Text("7 объявлений")
                        }
                    }
                    MainButton(label: "Редактировать профиль")
                        .padding(.bottom)

                    profileFilterBar
                        .padding(.horizontal)
                    if selectedFilter == .sells {
                        LazyVGrid(columns: column, spacing: 20) {
                            ForEach(productList.reversed(), id: \.id) { product in
                                NavigationLink(value: product) {
                                    ProductCard(product: product)
                                }
                            }
                        }
                        .padding()
                    } else if selectedFilter == .wants {
                        LazyVGrid(columns: column, spacing: 20) {
                            ForEach(favoriteList, id: \.id) { product in
                                NavigationLink(value: product) {
                                    ProductCard(product: product)
                                }
                            }
                        }
                        .padding()
                    } else {
                        LazyVGrid(columns: column, spacing: 20) {
                            ForEach(endList, id: \.id) { product in
                                NavigationLink(value: product) {
                                    ProductCard(product: product)
                                }
                            }
                        }
                        .padding()
                    }
                }
                .navigationDestination(for: Product.self) { product in
                    ProductDetailView(product: product)
                }
            }
            .navigationTitle("Мой профиль")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Refresh")
                    }) {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(90))
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }

    var profileFilterBar: some View {
        HStack {
            ForEach(ProfileFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundStyle(selectedFilter == item ? .black : .gray)
                    if selectedFilter == item {
                        Capsule()
                            .foregroundStyle(.black)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundStyle(.clear)
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
}

#Preview {
    ProfileView()
}

let favoriteList = [Product(id: UUID(), category: .electronics(type: .TVs), title: "Телевизор", description: "Пианино Лирика для занятий ребенку,а так же взрослым и начинающим,так и опытным музыкантам. Профессиональная доставка и насторойка по Москве и Московской области за дополнительную оплату.", condition: .new, images: ["telek"], price: 45)]

let endList = [Product(id: UUID(), category: .electronics(type: .TVs), title: "Гитара", description: "Пианино Лирика для занятий ребенку,а так же взрослым и начинающим,так и опытным музыкантам. Профессиональная доставка и насторойка по Москве и Московской области за дополнительную оплату.", condition: .new, images: ["guitar"], price: 45)]
