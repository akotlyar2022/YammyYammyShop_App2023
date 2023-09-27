//
//  UserModel.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 24.09.23.
//

import Foundation

struct MWUser: Identifiable {
    var id: String
    var name: String
    var phone: Int
    var adress: String
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["adress"] = self.adress
        
        return repres
    }
}
