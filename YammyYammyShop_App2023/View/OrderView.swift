//
//  OrderView.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 27.09.23.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var orderViewModel: OrderViewModel
    
    var statuses: [String] {
        var sts = [String]()
        
        for status in OrderStatus.allCases {
            sts.append(status.rawValue)
        }
        return sts
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text("\(orderViewModel.user.name)")
                .font(.title3).bold()
            Text("+995 \(orderViewModel.user.phone)")
                .bold()
            Text("\(orderViewModel.user.address)")
        }.padding()
            .onAppear{
                orderViewModel.getUserData()
            }
        Picker(selection: $orderViewModel.order.status) {
            ForEach(statuses, id: \.self) { status in
                Text(status)
            }
        } label: {
            Text("Order status")
        }
        .pickerStyle(.segmented)
        .onChange(of: orderViewModel.order.status) { newStatus in
            DBService.sharedDB.setOrder(order: orderViewModel.order) { result in
                switch result {
                    
                case .success(let order):
                    print(order.status)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }

            
        List {
            ForEach(orderViewModel.order.positions, id: \.id) { position in
                PositionCell(position: position)
            }
            Text("Total: \(orderViewModel.order.cost)")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orderViewModel: OrderViewModel(order: Order(userID: "", date: Date(), status: "new")))
    }
}

//#Preview {
//    OrderView()
//}
