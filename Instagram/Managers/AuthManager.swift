//
//  AuthManager.swift
//  Instagram
//
//  Created by Mohammad Afshar on 15/09/2023.
//

import Foundation
import FirebaseAuth

final class AuthManager {
    let auth = Auth.auth()
    static let shared = AuthManager()
    
    public var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    private init() {}
    
    public func signIn(name: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        
    }
    
    public func signUp(email: String, password: String, username: String, profilePicture: Data?, completion: @escaping (Result<User, Error>) -> Void) {
        
    }
    
    public func signedOut(completion: @escaping (Bool) -> Void) {
        
    }
}
