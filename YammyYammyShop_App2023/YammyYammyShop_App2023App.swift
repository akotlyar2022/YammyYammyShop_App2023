//
//  YammyYammyShop_App2023App.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 22.09.23.
//

import SwiftUI
import Firebase
import FirebaseAuth

let screen = UIScreen.main.bounds // main screen sizes

@main
struct YammyYammyShop_App2023App: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            
            if let user = AuthService.sharedAuth.currentUser {
                if user.uid == "dFgMvyuMPiRHdLXqJlqFXK1AQBM2" { // id admin
                    AdminOrdersView()
                } else {
                    let viewModel = MainTabBarViewModel(user: user)
                    MainTabBar(viewModel: viewModel)
                }
                
            } else {
                AuthView()
            }
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            print("AppDelegate OK")
            
            return true
        }
    }
}
