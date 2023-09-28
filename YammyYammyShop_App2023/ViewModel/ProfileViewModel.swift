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
        DBService.sharedDB.getOrder(by: AuthService.sharedAuth.currentUser!.uid) { result in
            
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
            
            print("Total orders: \(self.orders.count)")
            for (index, order) in self.orders.enumerated() {
                DBService.sharedDB.getPositions(by: order.id) { result in
                    switch result {
                    case .success(let positions):
                        self.orders[index].positions = positions
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
            
            func setProfile() {
                DBService.sharedDB.setProfile(user: self.profile) { result in
                    switch result {
                        
                    case .success(let user):
                        print(user.name)
                    case .failure(let error):
                        print("Data sending error \(error.localizedDescription)")
                    }
                }
            }
            
            func getProfile() {
                DBService.sharedDB.getProfile { result in
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
}
