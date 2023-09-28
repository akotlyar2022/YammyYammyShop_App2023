//
//  OrderViewModel.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 27.09.23.
//

import Foundation
import FirebaseFirestore


class OrderViewModel: ObservableObject {
    
    @Published var order: Order
    @Published var user = MWUser(id: "", name: "", phone: 0, address: "")
    
    init(order: Order) {
        self.order = order
    }
    
    func getUserData() {
        DBService.sharedDB.getProfile { result in
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
