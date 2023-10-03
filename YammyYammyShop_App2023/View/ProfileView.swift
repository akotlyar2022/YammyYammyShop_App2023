//
//  ProfileView.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresented = false
    @State var isQuitAlertPresented = false
    @State var isAuthViewPresented = false
    
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        VStack (alignment: .center) {
            
            HStack {
                Spacer()
                Image("customer")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .onTapGesture { // Change foto profile from Photo or Galery with confirmation dialog
                        isAvaAlertPresented.toggle()
                    }
                    .confirmationDialog("Foto", isPresented: $isAvaAlertPresented) {
                        Button {
                            print("Foto Library")
                        } label: {
                            Text("From Galery")
                        }
                        
                        Button {
                            print("Camera")
                        } label: {
                            Text("From Camera")
                        }

                    }
                Spacer(minLength: 20)
                
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Enter name", text: $viewModel.profile.name)
                        .font(.title.bold())
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                    HStack {
                        Text("+")
                        TextField("Enter phone number", text: $viewModel.profile.phone)
                    }.font(.title2.bold())
                }.padding(30)
            }
            
            VStack(alignment: .leading)  {
                Text("Delivery address")
                    .padding()
                    .font(.title.bold())
                    .foregroundColor(.blue)
                TextField("Enter delivery address", text: $viewModel.profile.address)
                    .padding()
                    .font(.title2.bold())
            }.padding()
            
            // Table with orders
            List {
                if viewModel.orders.count == 0 {
                    Text("Your orders")
                } else {
                    ForEach(viewModel.orders, id: \.id) { order in
                        OrderCell(order: order)
                    }
                }
                
            }.listStyle(.sidebar)
            
            Button {
                isQuitAlertPresented.toggle()
            } label: {
                Text("Go out")
                    .padding()
                    .padding(.horizontal, 30)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .font(.title.bold())
                    .cornerRadius(15)
            }.padding()
                .confirmationDialog("Log out of your profile?", isPresented: $isQuitAlertPresented, titleVisibility: .visible){
                    
                    Button {
                        isAuthViewPresented.toggle()
                    } label: {
                        Text("Yes")
                    }
                }
                .fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil) {
                    AuthView()
                
            }
        }
        .onSubmit {
            print("On Submit")
            viewModel.setProfile()
        }
        .onAppear {
            self.viewModel.getProfile()
            self.viewModel.getOrders()
        }
    }
        
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(profile: MWUser(id: "", name: "", phone: "", address: "")))
    }
}
