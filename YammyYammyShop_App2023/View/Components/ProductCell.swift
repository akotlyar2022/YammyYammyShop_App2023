//
//  ProductCell.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    
    var body: some View {
        
        VStack {
            Image("productOrange")
                .resizable()
                .aspectRatio(contentMode: .fill)
                
            HStack {
                Text("\(product.title)")
                    .font(.custom("AvenirNext-bold", size: 20))
                    .foregroundColor(.blue)

                Spacer()
                Text("\(product.price) $")
                    .font(.custom("AvenirNext-bold", size: 20))
                    .foregroundColor(.green)
                //Text(product.description)
            }
            .padding(.horizontal, 40)
//            Text("\(product.description)")
//                .padding(.horizontal, 30)
//                .padding(.vertical, 20)
//                .font(.title2)
                
        }.frame(width: screen.width * 0.95, height: screen.height * 0.35)
        
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "001",
                title: "Orange",
                imageUrl: "NotFound",
                                     price: 2.0,
                description: "Best oranges in Georgia. Grow up in region Ajara. Very very very tasty!"))
    }
}
