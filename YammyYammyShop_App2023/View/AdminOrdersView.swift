//
//  AdminOrdersView.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 27.09.23.
//

import SwiftUI

struct AdminOrdersView: View {
    
    @StateObject var admViewModel = AdminOrdersViewModel()
    @State var isOrderViewShow = false
    @State var isShowAuthView = false
    @State private var isShowAddProductView = false
    

    var body: some View {
        
        VStack {
            HStack {
                Button {
                    AuthService.sharedAuth.signOut()
                    isShowAuthView.toggle()
                } label: {
                    Text("Exit")
                        .font(.title2)
                        .frame(minWidth: 80)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(15)
                }
                Spacer()
                
                Button {
                    isShowAddProductView.toggle()
//                    print("Add new")
                } label: {
                    Text("Add new")
                        .font(.title2)
                        .frame(minWidth: 80)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(15)
                }

                
                Spacer()
                Button {
                    admViewModel.getOrder()
                } label: {
                    Text("Refresh")
                        .font(.title2)
                        .frame(minWidth: 80)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(15)
                }
            }.padding()
            
            
            List {
                ForEach(admViewModel.orders, id: \.id) { order in
                    OrderCell(order: order)
                        .onTapGesture {
                            admViewModel.currentOrder = order
                            isOrderViewShow.toggle()
                        }
                }
            }.listStyle(.plain)
                .onAppear {
                    admViewModel.getOrder()
                }
                .sheet(isPresented: $isOrderViewShow) {
                    let orderViewModel = OrderViewModel(order: admViewModel.currentOrder)
                    OrderView(orderViewModel: orderViewModel)
                }
        }.fullScreenCover(isPresented: $isShowAuthView) {
            AuthView()
        }
        .sheet(isPresented: $isShowAddProductView) {
            AddProductView()
        }
        
        
    }
}

struct AdminOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        AdminOrdersView()
    }
}

//#Preview {
//    AdminOrdersView()
//}
