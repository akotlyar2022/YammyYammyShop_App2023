//
//  ProfileViewModel.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 24.09.23.
//

import Foundation


class ProfileViewModel: ObservableObject {
    
    @Published var profile: MWUser
    @Published var orders: [Order] = [Order]()
    
    init(profile: MWUser) {
        self.profile = profile
    }
    
    func getOrders() {
        DatabaseService.shared.getOrders(by: AuthService.shared.currentUser!.accessibilityHint) { result in
            
            switch result {
            case .success(let orders):
                self.orders = orders
                for (index, order) in self.orders.enumerated() {
                    DatabaseService.shared.getPositions(by: order.id) { result in
                        switch result {
                        case .success(let positions):
                            self.order[index].positions = positions
                            print(self.orders[index].cost)
                        case .failure(let failure):
                            print(error.localizedDescription)
                        }
                    }
                }
                
                print("Total orders: \(orders.count)")
                for (index, order) in self.orders.enumerated() {
                    DatabaseService.shared.getPositions(by: order.id) { result in
                        switch result {
                        case .success(let positions):
                            self.orders[index].positions = positions
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
        
        func setProfile() {
            DatabaseService.shared.setProfile(user: self.profile) { result in
                switch result {
                    
                case .success(let user):
                    print(user.name)
                case .failure(let error):
                    print("Data sending error \(error.localizedDescription)")
                }
            }
        }
        
        func getProfile() {
            DatabaseService.shared.getProfile { result in
                switch result {
                    
                case .success(let user):
                    self.profile  = user
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
}
