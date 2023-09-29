//
//  Product.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import Foundation

struct Product {
    var id: String
    var title: String
    var imageUrl: String = ""
    var price: Double
    var description: String
    
    //var ordersCount: Int
    //var isRecomend: Bool
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["title"] = self.title
        repres["price"] = self.price
        repres["description"] = self.description
        
        return repres
    }
}
