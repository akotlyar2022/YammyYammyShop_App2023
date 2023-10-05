//
//  ProductCell.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    
    @State var uiImage = UIImage(named: "product")
    
    var body: some View {
        
        VStack {
            Image(uiImage: uiImage!)
                .resizable()
                .cornerRadius(30)
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.5)
                .frame(maxWidth: 500, maxHeight: 500)
                .clipped()
                
                
            HStack {
                Text("\(product.title)")
                    .font(.title2).bold()
                    .foregroundColor(.blue)

                Spacer()
                Text("\(product.price) $")
                    .font(.title2).bold()
                    .foregroundColor(.green)
            }
            .padding(.horizontal, 40)
                
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
