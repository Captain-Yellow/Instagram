//
//  StorageManager.swift
//  Instagram
//
//  Created by Mohammad Afshar on 15/09/2023.
//

import Foundation
import FirebaseStorage

final class StorageManager {
    static let shared = StorageManager()
    private let storage = Storage.storage().reference()
    
    private init() {}
    
    public func uploadProfilePhoto(username: String, photo: Data, complition: @escaping (Bool) -> Void) {
        storage.child("\(username)/profile_photo.png").putData(photo) { _, error in
            complition(error == nil)
        }
    }
}
