//
//  OrderView.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 27.09.23.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var ordViewModel: OrderViewModel
    
    var statuses: [String] {
        var sts = [String]()
        
        for status in OrderStatus.allCases {
            sts.append(status.rawValue)
        }
        return sts
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text("\(ordViewModel.user.name)")
                .font(.title3).bold()
            Text("+995 \(ordViewModel.user.phone)")
                .bold()
            Text("\(ordViewModel.user.address)")
        }.padding()
            .onAppear{
                ordViewModel.getUserData()
            }
        Picker(selection: $ordViewModel.order.status) {
            ForEach(statuses, id: \.self) { status in
                Text(status)
            }
        } label: {
            Text("Order status")
        }
        .pickerStyle(.segmented)
        .onChange(of: ordViewModel.order.status) { newStatus in
            DBService.sharedDB.setOrder(order: ordViewModel.order) { result in
                switch result {
                    
                case .success(let order):
                    print(order.status)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }

            
        List {
            ForEach(ordViewModel.order.positions, id: \.id) { position in
                PositionCell(position: position)
            }
            Text("Total: \(ordViewModel.order.cost)")
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
