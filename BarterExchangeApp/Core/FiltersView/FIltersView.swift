//
//  SwiftUIView.swift
//  BarterExchangeApp
//
//  Created by Pavel Vyaltsev on 23.04.2024.
//

import SwiftUI

struct FiltersView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // Manufacturer Section
                    Text("Производитель")
                        .font(.headline)
                        .padding(.vertical)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(["LG", "Samsung", "Lenovo", "Horizont"], id: \.self) { manufacturer in
                                Button(manufacturer) {
                                    // Handle selection
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .background(Color.gray.opacity(0.2))
                                .foregroundStyle(.black)
                                .cornerRadius(15)
                            }
                        }
                    }

                    Divider()

                    // Types Section
                    Text("Диагональ (дюймы)")
                        .font(.headline)
                        .padding(.vertical)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(["1-29", "30-32", "33-43", "44-54", "55-65", "65 и более"], id: \.self) { manufacturer in
                                Button(manufacturer) {
                                    // Handle selection
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .foregroundStyle(.black)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(15)
                            }
                        }
                    }

                    Divider()

                    Text("Поддержка SmartTV")
                        .font(.headline)
                        .padding(.vertical)
                    HStack {
                        ForEach(["Да", "Нет"], id: \.self) { manufacturer in
                            Button(manufacturer) {
                                // Handle selection
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .foregroundStyle(.black)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(15)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .overlay(alignment: .bottom)  {
                MainButton(label: "Показать товары")
            }
            .navigationTitle("Фильтры")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FiltersView()
}
