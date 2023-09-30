//
//  OrderStatus.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 24.09.23.
//

import Foundation
import FirebaseFirestore

enum OrderStatus: String, CaseIterable {
    case new = "New"
    case packing = "Pack"
    case delivering = "Deliver"
    case completed = "Complete"
    case canceled = "Cancel"
}
