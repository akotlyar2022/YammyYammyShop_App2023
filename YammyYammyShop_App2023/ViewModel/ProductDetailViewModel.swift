//
//  ProductDetailViewModel.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import Foundation
import UIKit

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var sizes = ["1 kg Box", "3 kg Box -10%", "10 kg Box -15%", "20 kg Box -20%"]
    @Published var count = 0
    @Published var image = UIImage(named: "product")!
    
    init(product: Product) {
        self.product = product
    }
    
    func getPrice(size: String) -> Int {
        switch size {
        case "1 kg Box": return (product.price)
            // feachure for next period
//        case "3 kg Box -10%": return ((product.price)/100) * 90
//        case "10 kg Box -15%": return ((product.price)/100) * 85
//        case "20 kg Box -20%": return ((product.price)/100) * 80
        default: return (product.price)
        }
    }
    func getImage() {
        StorageSevice.sharedStorage.downloadProductImage(id: product.id) { result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    self.image = image
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
