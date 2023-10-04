//
//  ProductDetailView.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import SwiftUI

struct ProductDetailView: View {
    
    
    @State var viewModel: ProductDetailViewModel
    @State var size = "1 kg Box"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode // enviroment property
    
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: self.viewModel.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .shadow(color: .orange,radius: 20)
                .cornerRadius(30)
            Spacer()
            HStack {
                Spacer()
                Text("\(viewModel.product.title)")
                    .font(.title2.bold())
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Spacer()
                    Text("Price: \(viewModel.getPrice(size: self.size))")
                        .font(.title2.bold())
                        .foregroundColor(.green)
                    
                
                Spacer()
            }
            Spacer()
            Text("\(viewModel.product.description)")
                .font(.title)
                .foregroundColor(.black)
                .padding()
            Spacer()
            
            HStack {
                Picker("BoxSize", selection: $size) {
                    ForEach(viewModel.sizes, id: \.self) { item in
                        Text(item)
                    }
                }.pickerStyle(.menu)
                    .padding(4)
                Stepper("", value: $count, in: 1...20)
                    .padding(.horizontal)
//                    .frame(minWidth: 30)
                Text("\(self.count)")
                    .padding(10)
                    .font(.title2)
            }
            .padding()
                Spacer()
            
            Text("Total: \(viewModel.getPrice(size: self.size) * count)")
                .font(.title2.bold())
                .foregroundColor(.red)
            
            Button { // add position from DetailView and send to CartView
                    var position = Position(id: UUID().uuidString,
                                            product: viewModel.product,
                                            count: self.count)
                    position.product.price = viewModel.getPrice(size: size)
                    
                    CartViewModel.shared.addPosition(position)
                    presentationMode.wrappedValue.dismiss() // close view vith enviroment property
                } label: {
                    Text("Add to cart")
//                        .padding()
//                        .cornerRadius(10)
//                        .foregroundColor(.blue)
//                        .font(.title.bold())
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: 200)
                        .background(Color(.blue))
                        .cornerRadius(20)
                }
                .onAppear {
                    self.viewModel.getImage()
                }
            
            Spacer()
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "001", title: "", imageUrl: "", price: 0, description: "")))
    }
}
