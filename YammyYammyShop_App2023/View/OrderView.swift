//
//  OrderView.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 27.09.23.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var viewModel: OrderViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text("\(viewModel.user.name)")
                .font(.title3).bold()
            Text("+995 \(viewModel.user.phone)")
                .bold()
            Text("\(viewModel.user.address)")
            List {
                ForEach(viewModel.order.positions, id: \.id) { position in
                    PositionCell(position: position)
                }
            }
        }.padding()
            .onAppear {
                viewModel.getUserData()
            }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel(order: Order(userID: "", date: Date(), status: "new")))
    }
}

//#Preview {
//    OrderView()
//}
