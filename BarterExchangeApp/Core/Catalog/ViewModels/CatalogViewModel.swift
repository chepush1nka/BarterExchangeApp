//
//  CatalogViewModel.swift
//  BarterExchangeApp
//
//  Created by Pavel Vyaltsev on 22.04.2024.
//

import Combine
import SwiftUI

class CatalogViewModel: ObservableObject {
    @Published var searchText: String = ""

    @Published var suggestions = Category.getAllCasesString()

    var categories = Category.getAllCases()

    var filteredSuggestions: [String] {
        guard !searchText.isEmpty else { return suggestions }
        return suggestions.sorted().filter { $0.lowercased().contains(searchText.lowercased()) }
    }

    var isSearching: Bool {
        return !searchText.isEmpty
    }

    var filteredCategories: [Category] {
        guard !searchText.isEmpty else {
            return categories
        }
        return categories.filter { $0.toString().localizedStandardContains(searchText) }
    }
}

