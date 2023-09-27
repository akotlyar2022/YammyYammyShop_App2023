//
//  AdminOrdersView.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 27.09.23.
//

import SwiftUI

struct AdminOrdersView: View {
    
    @StateObject var viewModel = AdminOrdersViewModel()
    @State var isorderViewShow = false
    
    

    var body: some View {
        List {
            ForEach(viewModel.orders, id: \.id) { order in
                OrderCell(order: order)
                viewModel.currentOrder = order
                    .onTapGesture {
                        isorderViewShow.toggle()
                    }
            }
        }.listStyle(.plain)
            .onAppear() {
                viewModel.getOrders()
            }
            .sheet(isPresented: $isorderViewShow) {
                let orderViewModel = OrderViewModel(order: viewModel.currentOrder)
                OrderView(viewModel: orderViewModel)
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
