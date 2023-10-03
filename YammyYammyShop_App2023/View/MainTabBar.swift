//
//  MainTapBar.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import SwiftUI

struct MainTabBar: View {
    
    var viewModel: MainTabBarViewModel
    
    var body: some View {
        TabView {
            NavigationView { // Wrap it in Navigation View for transition
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
        ProfileView(viewModel: ProfileViewModel(profile: MWUser(id: "", name: "", phone: "", address: "")))
            .tabItem {
                VStack {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            }
        }
    }
}


