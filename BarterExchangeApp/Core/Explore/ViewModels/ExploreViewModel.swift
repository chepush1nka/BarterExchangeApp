//
//  ExploreViewModel.swift
//  BarterExchangeApp
//
//  Created by Pavel Vyaltsev on 19.04.2024.
//

import Combine
import SwiftUI

class ExploreViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var selectedFilter: ExploreFilterScopes = .recomendations

    @Published var suggestions = ["Телевизор", "Пианино", "Игрушки", "Картина", "Гитара", "iPhone",
                                  "Монитор", "Сапоги", "Кроссовки", "Коляска",
                                  "Клавиатура", "Наушнники", "Кресло"]

    var filteredSuggestions: [String] {
        guard !searchText.isEmpty else { return suggestions }
        return suggestions.sorted().filter { $0.lowercased().contains(searchText.lowercased()) }
    }

    var isSearching: Bool {
        return !searchText.isEmpty
    }

    var filteredProducts: [Product] {
        guard !searchText.isEmpty else {
            return productList
        }
        return productList.filter { $0.title.localizedStandardContains(searchText) }
    }
}

enum ExploreFilterScopes: Int, CaseIterable {
    case recomendations
    case new
    case nearby

    var title: String {
        switch self {
        case .recomendations:
            "Рекомендации"
        case .new:
            "Новое"
        case .nearby:
            "Рядом"
        }
    }
}
