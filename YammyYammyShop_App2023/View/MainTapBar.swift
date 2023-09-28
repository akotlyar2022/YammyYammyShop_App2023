//
//  MainTapBar.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import SwiftUI

struct MainTapBar: View {
    
    var mainTapBarViewModel: MainTapBarViewModel
    
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
            CartView(cartViewModel: CartViewModel.shared)
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                        Text("Cart")
                    }
                }
            ProfileView(profViewModel: ProfileViewModel(profile: MWUser(id: "",
                                                                      name: "Name",
                                                                      phone: 380503180045,
                                                                      address: "Address")))
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
//        MainTapBar(mainTapBarViewModel: MainTapBarViewModel(user: user()))
//    }
//}
