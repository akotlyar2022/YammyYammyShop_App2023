//
//  AddProductView.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 29.09.23.
//

import SwiftUI

struct AddProductView: View {
    
    @State private var showImagePicker = false
    @State private var image = UIImage(named: "addNewProduct")!
    @State private var title: String = ""
    @State private var price: Int? = nil
    @State private var description: String = ""
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            Text("Add new product to Catalog")
                .font(.title).bold()
                .foregroundColor(.green)
                .padding(20)
            Text("Choose photo")
                .font(.title2).bold()
                .foregroundColor(.blue)
                .padding()
            
            Image(uiImage: image)
                .resizable()
                .frame(maxWidth: 280, maxHeight: 250, alignment: .center)
                .onTapGesture {
                    showImagePicker.toggle()
                }
                .cornerRadius(30)
                .shadow(color: .orange, radius: 20)
            
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        }
        VStack {
            Spacer()
            HStack {
                Text("Product:").font(.title2).bold()
                    .foregroundColor(.blue)
                    .padding()
                TextField("Add title", text: $title)
                    .font(.title2)
                    .frame(alignment: .leading)
            }
            HStack {
                Text("Price:").font(.title2).bold()
                    .foregroundColor(.blue)
                    .padding()
                TextField("", value: $price, format: .number)
                    .font(.title2)
                    .frame(alignment: .leading)
                    .keyboardType(.numberPad)
            }
            
            HStack {
                Text("Description:").font(.title2).bold()
                    .foregroundColor(.blue)
                    .padding()
                TextField("Add description", text: $description)
                    .font(.title2)
                    .frame(alignment: .leading)
            }
            Spacer()
            Button {
                
                guard let price = price else {
                    print("Not able show the price from TextField")
                    return
                }
                
                let product = Product(id: UUID().uuidString, title: title, price: price, description: description)
                
                guard let imageData = image.jpegData(compressionQuality: 0.2) else { return }
                
                DBService.sharedDB.setProduct(product: product, image: imageData) { result in
                    
                    switch result {
                        
                    case .success(let product):
                        print(product.title)
                        dismiss()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            } label: {
                Text("Save").font(.title2).bold()
                    .padding()
                    .padding(.horizontal, 30)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
        }.frame(alignment: .leading)
    }
}

//struct AddProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddProductView()
//    }
//}


#Preview {
    AddProductView()
}
