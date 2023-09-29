//
//  AuthService.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 24.09.23.
//

import Foundation
import FirebaseAuth

class AuthService {
    static let sharedAuth = AuthService()
    
    private init() {}
    
    private let auth = Auth.auth() // List vith users
    
    var currentUser: User? { // User - Object from Firebase
        return auth.currentUser
        
    }
    
    func signOut() {
        try! auth.signOut()
    }
    
    func signUp(email: String, password: String, completion: @escaping(Result<User, Error>) -> Void) {
        
        auth.createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                let mwUser = MWUser(id: result.user.uid, 
                                       name: "",
                                       phone: 0,
                                       address: "")
                
                DBService.sharedDB.setUser(user: mwUser) { resultDataBase in
                    switch resultDataBase {
                    case .success(_):
                        completion(.success(result.user))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping(Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
