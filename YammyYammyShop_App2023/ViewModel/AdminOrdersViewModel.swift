//
//  AdminOrdersViewModel.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 27.09.23.
//

import Foundation

class AdminOrdersViewModel: ObservableObject {
    
    @Published var orders = [Order]()
    var currentOrder = Order(userID: "", date: Date(), status: "new")
    
    func getOrder() {
        DBService.sharedDB.getOrders(by: nil) { result in
            switch result {
            case .success(let orders):
                self.orders = orders
                
                for (index, order) in self.orders.enumerated() {
                    DBService.sharedDB.getPositions(by: order.id) { result in
                        
                        switch result {
                        case .success(let positions):
                            self.orders[index].positions = positions
                            print(self.orders[index].cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
