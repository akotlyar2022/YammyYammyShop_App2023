//
//  ContentView.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 22.09.23.
//

import SwiftUI

struct AuthView: View {
    
    @State private var isAuth = true
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var isTabViewShow = false
    
    var body: some View {
        VStack(spacing: 48) {
            Text("YammyYammy")
                .padding()
                .padding(.horizontal, 15)
                .padding(.top, 50)
                //.font(.largeTitle.bold())
                .font(.system(size: 45, weight: .bold))
                //.background(Color("whiteAlfa"))
                .cornerRadius(20)
                .foregroundColor(.red)
            
            Text(isAuth ? "Authorization" : "Registration")
                .padding(isAuth ? 16 : 24)
                .padding(.horizontal, 30)
                //.padding(.top, 50)
                .font(.title.bold())
                .background(Color("whiteAlfa"))
                .cornerRadius(isAuth ? 20 : 40)
                .foregroundColor(isAuth ? .blue : .green)
            VStack {
                TextField("Enter e-mail", text: $email)
                    .padding()
                    .background(Color("whiteAlfa"))
                    .cornerRadius(15)
                    .padding(4)
                    .padding(.horizontal, 12)
                SecureField("Enter password", text: $password)
                    .padding()
                    .background(Color("whiteAlfa"))
                    .cornerRadius(15)
                    .padding(4)
                    .padding(.horizontal, 12)
                
                if !isAuth {
                    SecureField("Enter password again", text: $confirmPassword)
                        .padding()
                        .background(Color("whiteAlfa"))
                        .cornerRadius(15)
                        .padding(4)
                        .padding(.horizontal, 12)
                }
                
                Button {
                    if isAuth {
                        print("Client authorization throw Firebase ")
                        isTabViewShow.toggle()
                    } else {
                        print("Registration")
                        self.email = ""
                        self.password = ""
                        self.confirmPassword = ""
                        self.isAuth.toggle()
                    }
                } label: {
                    Text(isAuth ? "Enter" : "Create account")
                        .font(.title2.bold())
                        .padding()
                        .frame(maxWidth: .infinity)
                        //.background(Color("orange"))
                        .cornerRadius(15)
                        .padding(10)
                        .padding(.horizontal, 12)
                }
                Button {
                    isAuth.toggle()
                } label: {
                    Text(isAuth ? "No account?" : "Have account")
                        .font(.title2.bold())
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        //.background(Color("orange"))
                        .cornerRadius(15)
                        .padding(10)
                        .padding(.horizontal, 12)
                }
                
            }
            .padding()
            .padding(.top, 20)
            .background(Color("whiteAlfa"))
            .cornerRadius(24)
            .padding(isAuth ? 30 : 12)
            
            
        }.frame(maxWidth: .infinity,  maxHeight: .infinity)
            .background(Image("yammyBG").ignoresSafeArea()
                .blur(radius: isAuth ? 0 : 7)
            )
            .animation(Animation.easeInOut(duration: 0.5), value: isAuth)
            .fullScreenCover(isPresented: $isTabViewShow) {
                MainTapBar()
            }
    }
}

#Preview {
    AuthView()
}
