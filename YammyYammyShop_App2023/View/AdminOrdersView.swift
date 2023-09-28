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
    

    var body: some View {
        
        VStack {
            HStack {
                Button {
                    AuthService.sharedAuth.signOut()
                    isShowAuthView.toggle()
                } label: {
                    Text("Exit")
                        .foregroundColor(.red)
                }
                Spacer()
                
                Button {
                    print("Add new ")
                } label: {
                    Text("Add new ")
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
                    OrderView(ordViewModel: orderViewModel)
                }
        }.fullScreenCover(isPresented: $isShowAuthView) {
            AuthView()
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
