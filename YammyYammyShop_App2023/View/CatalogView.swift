//
//  Catalog.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import SwiftUI

struct CatalogView: View {
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    
    @StateObject var viewModel = CatalogViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
//            Section("") { // Horizontal "Popular"
//                ScrollView(.horizontal, showsIndicators: false) {
//                    LazyHGrid(rows: layout, spacing: 8) {
//                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) {
//                            item in
//                            
//                            NavigationLink {
//                                
//                                let viewModel = ProductDetailViewModel(product: item)
//                                ProductDetailView(viewModel: viewModel)
//                            } label: {
//                                ProductCell(product: item)
//                            }
//                        }
//                    }.padding(.bottom, 50)
//                }.shadow(color: .green, radius: 50)
//                    .border(Color.green)
//                    
//            }
            
            Section("") { // Vertical "Fruits"
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layout) {
                        ForEach(viewModel.products, id: \.id) {
                            item in
                            NavigationLink {
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                            }
                        }
                    }.padding()
                }.shadow(color: .yellow, radius: 40)
                    .font(.title)
                    //.border(Color.black)
            }
        }.navigationTitle(Text("Catalog"))
            .onAppear{
                self.viewModel.getProducts()
            }
    }
}

#Preview {
    CatalogView()
}
