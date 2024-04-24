//
//  Product.swift
//  BarterExchangeApp
//
//  Created by Pavel Vyaltsev on 31.01.2024.
//

import Foundation

struct Product: Hashable {
    let id: UUID
    let category: Category
    let title: String
    let description: String
    let condition: Condition
    //let owner: User
    let images: [String]
    let price: Int
}

let productList = [Product(id: UUID(), category: .electronics(type: .TVs), title: "Телевизор", description: "Пианино Лирика для занятий ребенку,а так же взрослым и начинающим,так и опытным музыкантам. Профессиональная доставка и насторойка по Москве и Московской области за дополнительную оплату.", condition: .new, images: ["telek"], price: 45),
                   Product(id: UUID(), category: .musicAndInstruments(type: .guitars), title: "Касета", description: "Пианино Лирика для занятий ребенку,а так же взрослым и начинающим,так и опытным музыкантам. Профессиональная доставка и насторойка по Москве и Московской области за дополнительную оплату.", condition: .new, images: ["kaseta"], price: 45),
                   Product(id: UUID(), category: .electronics(type: .tablets), title: "Пленка", description: "Пианино Лирика для занятий ребенку,а так же взрослым и начинающим,так и опытным музыкантам. Профессиональная доставка и насторойка по Москве и Московской области за дополнительную оплату.", condition: .new, images: ["plenka"], price: 45),
                   Product(id: UUID(), category: .musicAndInstruments(type: .piano), title: "Пианино бу", description: "Пианино Лирика для занятий ребенку,а так же взрослым и начинающим,так и опытным музыкантам. Профессиональная доставка и насторойка по Москве и Московской области за дополнительную оплату.", condition: .new, images: ["piano"], price: 45),
                   Product(id: UUID(), category: .clothingAndAccessories(type: .jewelry), title: "Часы бу", description: "Пианино Лирика для занятий ребенку,а так же взрослым и начинающим,так и опытным музыкантам. Профессиональная доставка и насторойка по Москве и Московской области за дополнительную оплату.", condition: .new, images: ["chasi"], price: 45),
                   Product(id: UUID(), category: .healthAndBeauty(type: .parfume), title: "Духи Chanel", description: "Пианино Лирика для занятий ребенку,а так же взрослым и начинающим,так и опытным музыкантам. Профессиональная доставка и насторойка по Москве и Московской области за дополнительную оплату.", condition: .new, images: ["duhi"], price: 45),
                   Product(id: UUID(), category: .officeSupplies(type: .deskGadgets), title: "Печатная машинка", description: "Пианино Лирика для занятий ребенку,а так же взрослым и начинающим,так и опытным музыкантам. Профессиональная доставка и насторойка по Москве и Московской области за дополнительную оплату.", condition: .new, images: ["machinka", "telek"], price: 45)]
