//
//  ProductDetailView.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import SwiftUI

struct ProductDetailView: View {
    
    var viewModel: ProductDetailViewModel
    @State var size = "1 kg Box"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Spacer()
            Image("productOrange")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 300)
                .shadow(color: .orange,radius: 20)
            Spacer()
            HStack {
                Spacer()
                Text("\(viewModel.product.title)")
                    .font(.title.bold())
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("Price: \(Int(viewModel.getPrice(size: self.size))) $")
                    .font(.title.bold())
                    .foregroundColor(.green)
                Spacer()
            }
            Spacer()
            Text("\(viewModel.product.description)")
                .font(.title.bold())
                .foregroundColor(.black)
                .padding()
            Spacer()
            
            Picker("BoxSize", selection: $size) {
                ForEach(viewModel.sizes, id: \.self) { item in
                    Text(item)
                }
            }.pickerStyle(.menu)
                //.padding()
                //.border(.blue)
            HStack {
                Stepper("Quantity Boxes", value: $count, in: 1...20)
                    .padding(.horizontal, 20)
                Text("\(self.count)")
                    .padding(20)
                    .font(.title.bold())
                    .foregroundColor(.green)
            }
                Spacer()
                Button {
                    var position = Position(id: UUID().uuidString,
                                            product: viewModel.product,
                                            count: Double(self.count))
                    position.product.price = viewModel.getPrice(size: size)
                    
                    CartViewModel.shared.addPosition(position)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Add to cart")
                        .padding()
                        .cornerRadius(10)
                        .foregroundColor(.red)
                        .font(.title.bold())
                }
            
            Spacer()
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "001",
                                                                             title: "Orange",
                                                                             imageUrl: "NotFound",
                                                                             price: 2.0,
                                                                             description: "Best oranges in Georgia. Grow up in region Ajara. Very very very tasty!")
                                                           ))
    }
}
