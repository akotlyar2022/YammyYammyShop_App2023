//
//  ProductCell.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    
    @State var uiImage = UIImage(named: "productOrange")
    
    var body: some View {
        
        VStack {
            Image(uiImage: uiImage!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.90)
                .clipped()
                .cornerRadius(30)
                
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
            .onAppear {
                StorageSevice.sharedStorage.downloadProductImage(id: self.product.id) { result in
                    switch result {
                        
                    case .success(let data):
                        if let img = UIImage(data: data) {
                            self.uiImage = img
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "001", title: "", imageUrl: "", price: 0, description: ""))
    }
}
