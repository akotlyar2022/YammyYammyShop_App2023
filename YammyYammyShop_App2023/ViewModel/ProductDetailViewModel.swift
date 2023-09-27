//
//  ProductDetailViewModel.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var sizes = ["1 kg Box", "3 kg Box -10%", "10 kg Box -15%", "20 kg Box -20%"]
    @Published var count = 0
    
    init(product: Product) {
        self.product = product
    }
    
    func getPrice(size: String) -> Double {
        switch size {
        case "1 kg Box": return (product.price)
        case "3 kg Box -10%": return (product.price) * 0.9 * 3
        case "10 kg Box -15%": return (product.price) * 0.85 * 10
        case "20 kg Box -20%": return (product.price) * 0.8 * 20
        default: return 0
        }
        
    }
    
}
