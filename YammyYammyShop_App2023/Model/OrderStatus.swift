//
//  OrderStatus.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 24.09.23.
//

import Foundation
import FirebaseFirestore

enum OrderStatus: String, CaseIterable {
    case new = "New Order"
    case packing = "Order is Packing"
    case delivering = "Order is Delivering"
    case completed = "Order was Completed"
    case canceled = "Order was Canceled"
}
