//
//  Catalog.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import SwiftUI

struct CatalogView: View {
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.2))] // array of "grid" on screen
    
    @StateObject var viewModel = CatalogViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
//            Section("") { // Lazy grid Horizontal "Popular"
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
            
            Section("") { // Lazy grid Vertical "Fruits"
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layout) {
                        ForEach(viewModel.products, id: \.id) {
                            item in
                            NavigationLink { // transition to detailView
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                            }
                        }
                    }.padding()
                }.shadow(color: .orange, radius: 40)
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

//struct Catalog_Previews: PreviewProvider {
//    static var previews: some View {
//        CatalogView(viewModel: CatalogViewModel(product: Product(id: "", title: "", imageUrl: "", price: 0, description: "")))
//    }
//}
