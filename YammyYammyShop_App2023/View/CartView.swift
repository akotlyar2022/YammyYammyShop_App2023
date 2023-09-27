//
//  CartView.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 23.09.23.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        
        VStack {
            List(viewModel.positions) { position in
                PositionCell(position: position)
                    .swipeActions {
                        Button {
                            viewModel.positions.removeAll { pos in
                                pos.id == position.id
                            }
                        } label: {
                            Text("Delete")
                        }.tint(.red)
                    }
            }
            .listStyle(.plain)
            .navigationTitle("Cart")
            
            HStack {
                Text ("Total:")
                    .font(.largeTitle.bold())
                Spacer()
                Text ("\(Int(self.viewModel.cost)) $")
                    .font(.largeTitle.bold())            }.padding()
            
            HStack(spacing: 24) {
                Button {
                    print("Cancel")
                } label: {
                    Text("Cancel")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(.red))
                        .cornerRadius(20)
                        
                }
                
                Button {
                    print("Order")
                    
                    var order = Order(userID: AuthService.shared.currentUser!.uid,
                                      date: Date(),
                                      status: OrderStatus.new.rawValue)
                    order.positions = self.viewModel.positions
                    
                    DatabaseService.shared.setOrder(order: order) { result in
                        switch result {
                            
                        case .success(let order):
                            print(order.cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    Text("Order")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color(.green))
                        .cornerRadius(20)
                        
                }
            }.padding()
        }
    }
}

//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartView(viewModel: CartViewModel.shared)
//    }
//}
#Preview {
    CartView(viewModel: CartViewModel.shared)
}
