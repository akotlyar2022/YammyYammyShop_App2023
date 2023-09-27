//
//  PositionCell.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
        
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(Int(position.count)) boxes")
            Text("\(Int(position.cost)) $")
                .frame(width: 85, alignment: .trailing)
        }.padding(.horizontal)
        
    }
}

#Preview {
    PositionCell(position: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString, title: "Banana", imageUrl: "productOrange", price: 30, description: "Super Orange"), count: 3.0))
}
