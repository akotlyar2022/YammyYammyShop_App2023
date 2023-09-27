//
//  MainTapBar.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import SwiftUI

struct MainTapBar: View {
    
    var viewModel: MainTapBarViewModel
    
    var body: some View {
        TabView {
            NavigationView {
                CatalogView()
            }
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet.circle")
                        Text("Catalog")
                    }
                }
            CartView(viewModel: CartViewModel.shared)
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                        Text("Cart")
                    }
                }
            ProfileView(viewModel: ProfileViewModel(profile: MWUser(id: "",
                                                                      name: "Name",
                                                                      phone: 380503180045,
                                                                      adress: "Adress")))
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
                }
        }
    }
}

//struct MainTapBar_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTapBar(viewModel: MainTapBarViewModel(user: User()))
//    }
//}
