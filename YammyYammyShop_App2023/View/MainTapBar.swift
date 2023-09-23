//
//  MainTapBar.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import SwiftUI

struct MainTapBar: View {
    var body: some View {
        TabView {
            CatalogView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet.circle")
                        Text("Catalog")
                    }
                }
            CartView()
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                        Text("Cart")
                    }
                }
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
                }
        }
    }
}

#Preview {
    MainTapBar()
}
