//
//  Position.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import Foundation
import FirebaseFirestore

struct Position: Identifiable {
    var id: String
    var product: Product
    var count: Double
    
    var cost: Double {
        return product.price * self.count
    }
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = id
        repres["count"] = count
        repres["title"] = product.title
        repres["price"] = product.price
        repres["cost"] = self.cost
        return repres
    }
    
    internal init(id: String, product: Product, count: Double) {
        self.id = id
        self.product = product
        self.count = count
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        
        guard let id = data["id"] as? String else { return nil }
        guard let title = data["title"] as? String else { return nil }
        guard let price = data["price"] as? Double else { return nil }
        
        let product: Product = Product(id: "",
                                       title: title,
                                       imageUrl: "",
                                       price: price,
                                       description: "")
        guard let count = data["count"] as? Double else { return nil }
        
        self.id = id
        self.product = product
        self.count = count
    }
}
