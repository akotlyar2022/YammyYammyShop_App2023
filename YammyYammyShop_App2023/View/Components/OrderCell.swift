//
//  OrderCell.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 26.09.23.
//

import SwiftUI

struct OrderCell: View {
    
    var order: Order
    
    var body: some View {
        
            HStack {
                Text("\(order.date)")
                Text("\(order.cost)")
                    .bold()
                    .frame(width: 90)
                Text("\(order.status)")
                    .frame(width: 100)
                    .foregroundColor(.green)
            }
        }
    }

struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell(order: Order(userID: "", date: Date(), status: "New"))
    }
}
