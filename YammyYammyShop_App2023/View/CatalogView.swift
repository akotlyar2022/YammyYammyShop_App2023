//
//  Catalog.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import SwiftUI

struct CatalogView: View {
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Section("Popular") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layout, spacing: 8) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) {
                            item in
                            
                            NavigationLink {
                                
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(prodViewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                            }
                        }
                    }.padding(.bottom, 50)
                }.shadow(color: .green, radius: 50)
                    .border(Color.green)
                    
            }
            
            Section("Fruits") {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layout) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) {
                            item in
                            NavigationLink {
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(prodViewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                            }
                        }
                    }.padding()
                }.shadow(color: .yellow, radius: 40)
                    //.border(Color.black)
            }
        }.navigationTitle(Text("Catalog"))
    }
}

#Preview {
    CatalogView()
}
