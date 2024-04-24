//
//  ProductView.swift
//  BarterExchangeApp
//
//  Created by Pavel Vyaltsev on 31.01.2024.
//

import Foundation
import SwiftUI
import MapKit

struct ExploreView: View {
    @StateObject private var viewModel: ExploreViewModel = ExploreViewModel()
    @Namespace var animation

    @State private var cameraPosition: MapCameraPosition = .region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 55.7522, longitude: 37.6156), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))

    var column = [GridItem(.adaptive(minimum: 160), spacing: 20)]

    var body: some View {
        NavigationStack {
            ScrollView {

                if !viewModel.isSearching {
                    barterChainView
                        .padding(.horizontal)
                        .padding(.top)

                    Map(position: $cameraPosition)
                        .frame(height: 126)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal)
                        .padding(.top, 10)
                        .padding(.bottom)
                } else {
                    filterButton
                }

                exploreFilterBar
                    .padding(.horizontal)

                LazyVGrid(columns: column, spacing: 20) {
                    ForEach(viewModel.filteredProducts, id: \.id) { product in
                        NavigationLink(value: product) {
                            ProductCard(product: product)
                        }
                    }
                }
                .padding()
            }
            .navigationDestination(for: Product.self) { product in
                ProductDetailView(product: product)
            }
        }
        .searchable(text: $viewModel.searchText, prompt: "Поиск")
        .searchSuggestions {
            ForEach(viewModel.filteredSuggestions, id: \.self) { suggestion in
               Text(suggestion)
                 .searchCompletion(suggestion)
             }
        }
    }

    var filterButton: some View {
        HStack {
            Spacer()
            NavigationLink(destination: FiltersView()) {
                Image(systemName: "line.3.horizontal.decrease")
            }
        }
        .padding()
    }

    var barterChainView: some View {
        VStack {
            HStack {
                Text("Узнай свою цепочку обмена")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .padding(.horizontal)
                Spacer()
            }
            HStack {
                Text("Расскажем как и на что лучше обменять товары, чтобы получить желаемое")
                    .padding(.horizontal)
                Spacer()
            }
            HStack {
                Image("guitar")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .padding([.leading, .top, .bottom])
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 2)
                    .padding(.horizontal, -9)
                Image("lg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .padding([.top, .bottom])
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 2)
                    .padding(.horizontal, -9)
                Image("iphone")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .padding([.top, .bottom])
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 2)
                    .padding(.horizontal, -9)
                Image("note")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .padding([.top, .bottom, .trailing])
            }
        }
        .frame(minWidth: 0,
                           maxWidth: .infinity)
        .background(Color(red: 217/255, green: 247/255, blue: 23/255))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    var exploreFilterBar: some View {
        HStack {
            ForEach(ExploreFilterScopes.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(viewModel.selectedFilter == item ? .semibold : .regular)
                        .foregroundStyle(viewModel.selectedFilter == item ? .black : .gray)
                    if viewModel.selectedFilter == item {
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
                        self.viewModel.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color(.black) : Color.black.opacity(0.5))
            if (isActive) { Color(.black)
                .frame(width: 15, height: 2)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}
