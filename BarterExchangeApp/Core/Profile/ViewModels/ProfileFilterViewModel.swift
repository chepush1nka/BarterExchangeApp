//
//  ProfileFilterViewModel.swift
//  BarterExchangeApp
//
//  Created by Pavel Vyaltsev on 18.04.2024.
//

enum ProfileFilterViewModel: Int, CaseIterable {
    case sells
    case wants
    case concluded

    var title: String {
        switch self {
        case .sells:
            "Объявления"
        case .wants:
            "Избранное"
        case .concluded:
            "Завершенные"
        }
    }
}
