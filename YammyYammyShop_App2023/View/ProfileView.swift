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
    
    @StateObject var profViewModel: ProfileViewModel
    
    var body: some View {
        
        VStack (alignment: .center) {
            
            HStack {
                Spacer()
                Image("customer")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .onTapGesture {
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
                    TextField("Name", text: $profViewModel.profile.name)
                        .font(.title.bold())
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                    HStack {
                        Text("+995")
                        TextField("Phone", value: $profViewModel.profile.phone, format: .number)
                    }.font(.title2.bold())
                }.padding(30)
            }
            
            VStack(alignment: .leading)  {
                Text("Delivery address")
                    .padding()
                    .font(.title.bold())
                    .foregroundColor(.blue)
                TextField("Address", text: $profViewModel.profile.address)
                    .padding()
                    .font(.title2.bold())
            }.padding()
            
            // Table with orders
            List {
                if profViewModel.orders.count == 0 {
                    Text("Your orders")
                } else {
                    ForEach(profViewModel.orders, id: \.id) { order in
                        OrderCell(order: order)
                    }
                }
                
            }.listStyle(.plain)
            
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
                .confirmationDialog("Log out of your profile", isPresented: $isQuitAlertPresented) {
                    
                    Button {
                        isAuthViewPresented.toggle()
                    } label: {
                        Text("Yes")
                    }
                }
                .fullScreenCover(isPresented: $isAuthViewPresented) {
                    AuthView()
            }
        }
        .onSubmit {
//            viewModel.setProf()
        }
        .onAppear {
//            self.profViewModel.getProfile()
            self.profViewModel.getOrders()
        }
    }
        
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profViewModel: ProfileViewModel(profile: MWUser(id: "",
                                                                name: "Name",
                                                                phone: 380503180045,
                                                                address: "Address")))
    }
    
}
