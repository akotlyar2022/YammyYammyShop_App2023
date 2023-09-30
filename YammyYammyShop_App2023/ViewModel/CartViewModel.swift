//
//  CartViewModel.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import Foundation

class CartViewModel: ObservableObject {
    
    static let shared = CartViewModel()
    
    private init() {}
    
    @Published var positions = [Position]()
    
    
    var cost: Int {
        var sum: Int = 0
        
        for pos in positions {
            sum += pos.cost
        }
        return sum
    }
    
    
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
    
}
