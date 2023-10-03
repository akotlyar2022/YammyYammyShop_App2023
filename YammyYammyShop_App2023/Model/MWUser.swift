//
//  UserModel.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 24.09.23.
//

import Foundation
import FirebaseFirestore

struct MWUser: Identifiable {
    var id: String
    var name: String
    var phone: String
    var address: String
    
    var representation: [String: Any] { // data from db Firebase
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["address"] = self.address
        
        return repres
    }
}
