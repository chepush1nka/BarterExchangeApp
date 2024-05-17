//
//  CreateProductViewModel.swift
//  BarterExchangeApp
//
//  Created by Pavel Vyaltsev on 07.05.2024.
//

import SwiftUI
import PhotosUI
import FirebaseFirestore

class CreateProductViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var location: String = "Выберите город"

    @Published var photosPickerItems: [PhotosPickerItem] = [] {
        didSet {
            setImages(from: photosPickerItems)
        }
    }
    @Published var images: [UIImage] = []
    @Published var existingImagesUrl: [String]?

    @Published var selectedProductType = 0 {
        didSet {
            setSubtypes(from: selectedProductType)
        }
    }
    @Published var selectedProductSubtype = 0
    @Published var selectedCondition = 0
    @Published var showSearchCity = false

    let productTypes = Category.getAllCasesString()

    var productSubtypes: [String] = []

    let conditions: [String] = Condition.allCasesString()

    var existingProductUid: String?

    init(product: Product? = nil) {
        guard let existingProduct = product else {
            return
        }
        self.title = existingProduct.title
        self.description = existingProduct.description
        self.location = existingProduct.location
        self.selectedCondition = conditions.firstIndex(of: existingProduct.condition.rawValue) ?? 0
        self.selectedProductType = productTypes.firstIndex(of: existingProduct.category.toString()) ?? 0
        self.selectedProductSubtype = productSubtypes.firstIndex(of: existingProduct.category.toStringSubtype()) ?? 0
        self.existingImagesUrl = existingProduct.productImageUrls
        self.existingProductUid = existingProduct.productUid
    }

    func deleteProduct() {
        guard let uid = existingProductUid else {
            return
        }

        FirebaseManager.shared.firestore
            .collection("products")
            .document(uid)
            .delete() { error in
                if let error {
                    print(error)
                    return
                }
                print("success deleteProduct")
            }
    }

    func publishProduct() {
        persistImagesToStorage()
    }

    private func setImages(from selections: [PhotosPickerItem]) {
        Task {
            var selectedImages: [UIImage] = []
            for selection in selections {
                if let data = try? await selection.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        selectedImages.append(uiImage)
                    }
                }
            }
            DispatchQueue.main.async {
                self.images = selectedImages
            }
        }
    }

    private func setSubtypes(from selection: Int) {
        for category in Category.getAllCases() {
            if category.toString() == productTypes[selection] {
                DispatchQueue.main.async {
                    self.productSubtypes = category.toStringSubtypes()
                }
                break
            }
        }
    }

    private func persistImagesToStorage() {
        var productUid = UUID().uuidString
        if let exProductUid = existingProductUid {
            productUid = exProductUid
        }

        guard !self.images.isEmpty else {
            if let imgs = existingImagesUrl {
                self.storeProductInformation(productUid: productUid, urls: imgs)
            }
            return
        }
        var urls: [String] = []
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            return
        }

        let reference = FirebaseManager.shared.storage.reference(withPath: uid)

        for (index, image) in self.images.enumerated() {
            if let imageData = image.jpegData(compressionQuality: 0.5) {
                let uniqueReference = reference.child("\(productUid)_\(index).jpg")
                uniqueReference.putData(imageData) { metadata, error in
                    if let error {
                        print(error)
                        return
                    }
                    uniqueReference.downloadURL { url, error in
                        if let error {
                            print(error)
                            return
                        }
                        print(url?.absoluteString)
                        guard let url else { return }
                        urls.append(url.absoluteString)
                        if urls.count == self.images.count {
                            self.storeProductInformation(productUid: productUid, urls: urls)
                        }
                    }
                }
            }
        }
    }

    func storeProductInformation(productUid: String, urls: [String]) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            return
        }

        let productData = [
            "productUid": productUid,
            "userUid": uid,
            "title": title,
            "description": description,
            "productImageUrls": urls,
            "type": productTypes[selectedProductType],
            "subtype": productSubtypes[selectedProductSubtype],
            "condition": conditions[selectedCondition],
            FirebaseConstants.timestamp: Timestamp(),
            "location": location
        ] as [String : Any]

        FirebaseManager.shared.firestore
            .collection("products")
            .document(productUid)
            .setData(productData) { error in
                if let error {
                    print(error)
                    return
                }
                print("success storeProductInformation")
                self.clearAll()
            }
    }

    private func clearAll() {
        title = ""
        description = ""
        location = "Выберите город"
        photosPickerItems = []
        images = []
        existingImagesUrl = nil
        selectedProductType = 0
        selectedProductSubtype = 0
        selectedCondition = 0
        showSearchCity = false
        productSubtypes = []
        existingProductUid = nil
    }
}
