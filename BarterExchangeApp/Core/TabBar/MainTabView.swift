//
//  MainTabView.swift
//  BarterExchangeApp
//
//  Created by Pavel Vyaltsev on 17.04.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Image("BE")
                }
            CatalogView()
                .tabItem {
                    Image(systemName: "rectangle.on.rectangle")
                        .environment(\.symbolVariants, .none)
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "plus.circle")
                        .environment(\.symbolVariants, .none)
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "bubble.right")
                        .environment(\.symbolVariants, .none)
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                        .environment(\.symbolVariants, .none)
                }
                .navigationTitle("Мой профиль")
                .navigationBarTitleDisplayMode(.inline)
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
