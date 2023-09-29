//
//  StorageSevice.swift
//  YammyYammyShop_App2023
//
//  Created by macbook on 30.09.23.
//

import Foundation
import FirebaseStorage

class StorageSevice {
    
    static let sharedStorage = StorageSevice()
    
    private init () { }
    
    private var storage = Storage.storage().reference() // from Firebase
    private var productsRef: StorageReference {
        storage.child("products")
    }
    
    func upload(id: String, image: Data, completion: @escaping (Result<String, Error>) -> ()) {
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        productsRef.child(id).putData(image, metadata: metadata) { metadata, error in
            guard let metadata = metadata else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
                completion(.success("Uploaded image size: \(metadata.size)"))
        }
    }
}
