//
//  CatalogViewModel.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    var products = [
        Product(id: "001",
                title: "Orange",
                imageUrl: "NotFound",
                price: 2,
                description: "Best oranges in Georgia. Grow up in region Ajara. Very very very tasty!"),
        Product(id: "002",
                title: "Mandarin",
                imageUrl: "NotFound",
                price: 1,
                description: "Best mandarines in Georgia. Grow up in region Ajara. Very very very tasty!"),
        Product(id: "003",
                title: "Grapefruit",
                imageUrl: "NotFound",
                price: 3,
                description: "Best grapefruits in Georgia. Grow up in region Ajara. Very very very tasty!"),
        Product(id: "004",
                title: "Kiwi",
                imageUrl: "NotFound",
                price: 1,
                description: "Best kiwi in Georgia. Grow up in region Ajara. Very very very tasty!"),
        Product(id: "005",
                title: "Banana",
                imageUrl: "NotFound",
                price: 5,
                description: "Best banana in Georgia. Grow up in region Ajara. Very very very tasty!")
    
    ]
    
//    @Published var popularProducts = [
//        Product(id: "001",
//                title: "Orange",
//                imageUrl: "NotFound",
//                price: 2.0,
//                description: "Best oranges in Georgia. Grow up in region Ajara. Very very very tasty!"),
//        Product(id: "002",
//                title: "Mandarin",
//                imageUrl: "NotFound",
//                price: 1.0,
//                description: "Best mandarines in Georgia. Grow up in region Ajara. Very very very tasty!"),
//        Product(id: "003",
//                title: "Grapefruit",
//                imageUrl: "NotFound",
//                price: 3.0,
//                description: "Best grapefruits in Georgia. Grow up in region Ajara. Very very very tasty!"),
//        Product(id: "004",
//                title: "Kiwi",
//                imageUrl: "NotFound",
//                price: 2.0,
//                description: "Best kiwi in Georgia. Grow up in region Ajara. Very very very tasty!"),
//        Product(id: "005",
//                title: "Banana",
//                imageUrl: "NotFound",
//                price: 1.5,
//                description: "Best banana in Georgia. Grow up in region Ajara. Very very very tasty!")
//    
//    ]
    
    func getProducts() {
        DBService.sharedDB.getProducts { result in
            switch result {
            case .success(let products):
                self.products = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
