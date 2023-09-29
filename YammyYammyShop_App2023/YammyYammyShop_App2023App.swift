//
//  YammyYammyShop_App2023App.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 22.09.23.
//

import SwiftUI
import Firebase
import FirebaseAuth

let screen = UIScreen.main.bounds

@main
struct YammyYammyShop_App2023App: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            
            if let user = AuthService.sharedAuth.currentUser {
                if user.uid == "M6yPvss3nSbgW0h1d6NwM4vvAHS2" {
                    AdminOrdersView()
                } else {
                    let viewModel = MainTapBarViewModel(user: user)
                    MainTapBar(viewModel: viewModel)
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
