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
    
    internal func searchUsers(with usernamePrefix: String, complition: @escaping ([User]) -> Void) {
        let ref = database.collection("users")
        ref.getDocuments { snapshot, error in
            guard let users = snapshot?.documents.compactMap({ User(with: $0.data()) }), error == nil else {
                complition([])
                return
            }
            let subset = users.filter({
                $0.username.lowercased().hasPrefix(usernamePrefix.lowercased())
            })
            complition(subset)
        }
    }
    
    public func explorePosts(complition: @escaping ([Post]) -> Void) {
        let ref = database.collection("users")
        ref.getDocuments { snapshot, error in
            guard let users = snapshot?.documents.compactMap({ User(with: $0.data()) }), error == nil else {
                complition([])
                return
            }
            
            let dipatchGroup = DispatchGroup()
            var aggregatePost = [Post]()
            
            users.forEach { user in
                dipatchGroup.enter()
                
                let username = user.username
                let postRef = self.database.collection("users/\(username)/posts")
                
                postRef.getDocuments { snapshot, error in
                    
                    defer {
                        dipatchGroup.leave()
                    }
                    
                    guard let post = snapshot?.documents.compactMap({ Post(with: $0.data()) }), error == nil else {
                        return
                    }
                    
                    aggregatePost.append(contentsOf: post)
                }
                
                dipatchGroup.notify(queue: .main) {
                    complition(aggregatePost)
                }
            }
        }
    }
}
