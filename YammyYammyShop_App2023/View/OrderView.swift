//
//  OrderView.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 27.09.23.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var ordViewModel: OrderViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text("\(ordViewModel.user.name)")
                .font(.title3).bold()
            Text("+995 \(ordViewModel.user.phone)")
                .bold()
            Text("\(ordViewModel.user.address)")
            List {
                ForEach(ordViewModel.order.positions, id: \.id) { position in
                    PositionCell(position: position)
                }
            }
        }.padding()
            .onAppear {
                ordViewModel.getUserData()
            }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(ordViewModel: OrderViewModel(order: Order(userID: "", date: Date(), status: "new")))
    }
}

//#Preview {
//    OrderView()
//}
