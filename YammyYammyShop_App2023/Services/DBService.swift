//
//  DataBaseService.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 24.09.23.
//

import Foundation
import FirebaseFirestore

class DBService {
    
    static let sharedDB = DBService() // Singleton
    private let db = Firestore.firestore() // our root folder in FirebaseFirestore
    
    // links to folders "users", "orders", "products" in FirebaseFirestore
    private var usersRef: CollectionReference { return db.collection("users") }
    private var ordersRef: CollectionReference { return db.collection("orders") }
    private var productsRef: CollectionReference { return db.collection("products") }
    
    private init() { }
        
    func getPositions(by orderID: String, completion: @escaping (Result<[Position], Error>) -> Void) {
        
        let positionsRef = ordersRef.document(orderID).collection("positions")
        
        positionsRef.getDocuments { qSnap, error in // qSnap - "snapshot" part of our db snapshot of part order
            
            if let querySnapshot = qSnap {
                var positions = [Position]()
                
                for doc in querySnapshot.documents {
                    if let position = Position(doc: doc)  {
                        positions.append(position)
                    }
                }
                completion(.success(positions))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func getOrders(by userID: String?,
                  completion: @escaping (Result<[Order], Error>) -> Void) {
        
        self.ordersRef.getDocuments { qSnap, error in
            
            if let qSnap = qSnap {
                var orders = [Order]()
                for doc in qSnap.documents {
                    
                    // if userID received - orders only for this userID
                    if let userID = userID {
                        if let order = Order(doc: doc), order.userID == userID {
                            orders.append(order)
                        }
                    } else { //if userID dont received - all orders for all users.  this part for admin
                        if let order = Order(doc: doc) {
                            orders.append(order)
                        }
                    }
                }
                completion(.success(orders))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func setOrder(order: Order,
                  completion: @escaping (Result<Order, Error>) -> Void) {
        ordersRef.document(order.id).setData(order.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                self.setPosition(to: order.id, positions: order.positions) { result in
                    switch result {
                    case .success(let positions):
                        print(positions.count)
                        completion(.success(order))
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func setPosition(to orderId: String,
                      positions: [Position],
                      completion: @escaping (Result<[Position], Error>) -> Void) {
        
        let positionsRef = ordersRef.document(orderId).collection("positions")
        
        for position in positions {
            positionsRef.document(position.id).setData(position.representation)
        }
        completion(.success(positions))
    }

    func setProfile(user: MWUser,
                     completion: @escaping (Result<MWUser, Error>) -> Void) {
            usersRef.document(user.id).setData(user.representation) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(user))
                }
            }
        }
    
    func getProfile(by userId: String? = nil, completion: @escaping (Result<MWUser, Error>) -> ()) {
        
        usersRef.document(userId != nil ? userId! : AuthService.sharedAuth.currentUser!.uid).getDocument { docSnapshot, error in
            
                guard let snap = docSnapshot else { return }
                guard let data = snap.data() else { return }
                guard let userName = data["name"] as? String else { return }
                guard let id = data["id"] as? String else { return }
                guard let phone = data["phone"] as? String else { return }
                guard let address = data["address"] as? String else { return }
                
                let user = MWUser(id: id, name: userName, phone: phone, address: address)
                completion(.success(user))
            }
        }
    func setProduct(product: Product, image: Data, completion: @escaping(Result<Product, Error>) -> Void) {
        
        StorageSevice.sharedStorage.upload(id: product.id, image: image) { result in
            switch result {
                
            case .success(let sizeInfo):
                print(sizeInfo)
                self.productsRef.document(product.id).setData(product.representation) { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(product))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getProducts(completion: @escaping(Result<[Product], Error>) -> Void) {
        
        self.productsRef.getDocuments { qSnap, error in
            guard let qSnap = qSnap else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            
            let docs = qSnap.documents
            
            var products = [Product]()
            
            for doc in docs {
                guard let product = Product(doc: doc) else { return }
                products.append(product)
            }
            completion(.success(products))
        }
    }
    
    // setUser - put "user" into "users" in FirebaseFirestore
    
    func setUser(user: MWUser,
                 completion: @escaping (Result<MWUser, Error>) -> Void) {
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
}
    
    
    
        
        
        
        
        
    

    
    
    
        
