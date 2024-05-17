//
//  User.swift
//  BarterExchangeApp
//
//  Created by Pavel Vyaltsev on 29.02.2024.
//

class User: Hashable {
    let id: String
    let login: String
    let name: String

    private var exchangesHistory: [СoncludedDeal] = []
    private var exchangesOffers:  [Offer] = []
    private var rating: Float = 0
    private var favourites: [Offer] = []

    init(
        id: String,
        login: String,
        name: String,
        exchangesHistory: [СoncludedDeal] = [],
        exchangesOffers: [Offer] = [],
        rating: Float = 0,
        favourites: [Offer] = []
    ) {
        self.id = id
        self.login = login
        self.name = name
        self.exchangesHistory = exchangesHistory
        self.exchangesOffers = exchangesOffers
        self.rating = rating
        self.favourites = favourites
    }

    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}

struct СoncludedDeal: Hashable {
    let sdv: String
}

struct Offer: Hashable {
    let sdfv: String
}
