//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Mohammad Afshar on 15/09/2023.
//

import Foundation
import FirebaseFirestore

class DatabaseManager {
    static let shared = DatabaseManager()
    let database = Firestore.firestore()
    
    private init() {}
    
    public func createUser(newUser: User, complition: @escaping (Bool) -> Void) {
        let refrence = database.document("users/\(newUser.username)")
        guard let newUser = newUser.asDictionary() else {
            complition(false)
            return
        }
        refrence.setData(newUser) { error in
            complition(error == nil)
        }
    }
    
    public func findUser(with email: String, complition: @escaping (User?) -> Void) {
        let ref = database.collection("users")
        ref.getDocuments { snapShot, error in
            guard let users = snapShot?.documents.compactMap({ User(with: $0.data()) }), error == nil else {
                complition(nil)
                return
            }
            let user = users.first(where: {$0.email == email})
            complition(user)
        }
    }
}
