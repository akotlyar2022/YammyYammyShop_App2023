//
//  OrderView.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 27.09.23.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var viewModel: OrderViewModel
    
    var statuses: [String] {
        var sts = [String]()
        
        for status in OrderStatus.allCases { 
            sts.append(status.rawValue)
        }
        return sts
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text("\(viewModel.user.name)")
                .font(.title3).bold()
            Text("\(viewModel.user.phone)")
                .bold()
            Text("\(viewModel.user.address)")
            
            Picker(selection: $viewModel.order.status) {
                ForEach(statuses, id: \.self) { status in
                    Text(status)
                }
            } label: {
                Text("Order status")
            }
            .pickerStyle(.segmented)
            .onChange(of: viewModel.order.status) { newStatus in
                DBService.sharedDB.setOrder(order: viewModel.order) { result in
                    switch result {
                            
                    case .success(let order):
                        print(order.status)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
            .padding(15)

            
            List {
                ForEach(viewModel.order.positions, id: \.id) { position in
                    PositionCell(position: position)
                }
                Text("Total: \(viewModel.order.cost) $")
            }
            
        }.padding()
                .onAppear{
                    viewModel.getUserData()
        }
        
    }
}


#Preview {
    OrderView(viewModel: OrderViewModel(order: Order(userID: "", date: Date(), status: "new")))
}
