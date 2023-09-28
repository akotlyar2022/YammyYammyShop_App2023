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
    
    

    var body: some View {
        List {
            ForEach(admViewModel.orders, id: \.id) { order in
                OrderCell(order: order)
//                admViewModel.currentOrder = order
                    .onTapGesture {
                        isOrderViewShow.toggle()
                    }
            }
        }.listStyle(.plain)
            .onAppear() {
                admViewModel.getOrder()
            }
            .sheet(isPresented: $isOrderViewShow) {
                let orderViewModel = OrderViewModel(order: admViewModel.currentOrder)
                OrderView(ordViewModel: orderViewModel)
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
