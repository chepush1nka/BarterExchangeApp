//
//  Category.swift
//  BarterExchangeApp
//
//  Created by Pavel Vyaltsev on 10.02.2024.
//

enum Category: Hashable {
    case clothingAndAccessories(type: ClothingAndAccessoriesType)
    case electronics(type: ElectronicsType)
    case booksAndMagazines(type: BooksAndMagazinesType)
    case sportsAndOutdoors(type: SportsAndOutdoorsType)
    case homeAndGarden(type: HomeAndGardenType)
    case healthAndBeauty(type: HealthAndBeautyType)
    case musicAndInstruments(type: MusicAndInstrumentsType)
    case collectiblesAndArt(type: CollectiblesAndArtType)
    case craftsAndDIY(type: CraftsAndDIYType)
    case babyAndKids(type: BabyAndKidsType)
    case officeSupplies(type: OfficeSuppliesType)
    case petSupplies(type: PetSuppliesType)
    case vehiclesAndParts(type: VehiclesAndPartsType)

    func toString() -> String {
        switch self {
        case .clothingAndAccessories(type: _):
            "Одежда и аксессуары"
        case .electronics(type: _):
            "Электроника"
        case .booksAndMagazines(type: _):
            "Книги и журналы"
        case .sportsAndOutdoors(type: _):
            "Спорт и активный отдых"
        case .homeAndGarden(type: _):
            "Дом и сад"
        case .healthAndBeauty(type: _):
            "Красота и здоровье"
        case .musicAndInstruments(type: _):
            "Музыка и инструменты"
        case .collectiblesAndArt(type: _):
            "Искусство"
        case .craftsAndDIY(type: _):
            "Своими руками"
        case .babyAndKids(type: _):
            "Для детей"
        case .officeSupplies(type: _):
            "Для офиса"
        case .petSupplies(type: _):
            "Для животных"
        case .vehiclesAndParts(type: _):
            "Машины и запчасти"
        }
    }

    static func getAllCases() -> [Category] {
        [
            .clothingAndAccessories(type: .bags),
            .electronics(type: .TVs),
            .booksAndMagazines(type: .comics),
            .sportsAndOutdoors(type: .bicycles),
            .homeAndGarden(type: .gardenTools),
            .healthAndBeauty(type: .haircare),
            .musicAndInstruments(type: .CDs),
            .collectiblesAndArt(type: .antiques),
            .craftsAndDIY(type: .craftTools),
            .babyAndKids(type: .strollers),
            .officeSupplies(type: .deskGadgets),
            .petSupplies(type: .care),
            .vehiclesAndParts(type: .bicycles)
        ]
    }

    static func getAllCasesString() -> [String] {
        [
            Category.clothingAndAccessories(type: .bags).toString(),
            Category.electronics(type: .TVs).toString(),
            Category.booksAndMagazines(type: .comics).toString(),
            Category.sportsAndOutdoors(type: .bicycles).toString(),
            Category.homeAndGarden(type: .gardenTools).toString(),
            Category.healthAndBeauty(type: .haircare).toString(),
            Category.musicAndInstruments(type: .CDs).toString(),
            Category.collectiblesAndArt(type: .antiques).toString(),
            Category.craftsAndDIY(type: .craftTools).toString(),
            Category.babyAndKids(type: .strollers).toString(),
            Category.officeSupplies(type: .deskGadgets).toString(),
            Category.petSupplies(type: .care).toString(),
            Category.vehiclesAndParts(type: .bicycles).toString()
        ]
    }
}
