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
    
    enum AuthError: Error {
        case newUserCreation
        case signInFailed
    }
    
    public var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    private init() {}
    
    public func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        DatabaseManager.shared.findUser(with: email) { [weak self] user in
            guard let user = user else {
                completion(.failure(AuthError.signInFailed))
                return
            }
            self?.auth.signIn(withEmail: email, password: password) { result, error in
                guard result != result, error == nil else {
                    completion(.failure(AuthError.signInFailed))
                    return
                }
                UserDefaults.standard.setValue(user.username, forKey: "username")
                UserDefaults.standard.setValue(user.email, forKey: "email")
                completion(.success(user))
            }
        }
    }
    
    public func signUp(email: String, password: String, username: String, profilePicture: Data?, completion: @escaping (Result<User, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            guard authResult != nil, error == nil else {
                print("AuthManager - auth error")
                completion(.failure(AuthError.newUserCreation))
                print(error?.localizedDescription ?? "")
                print(error ?? "")
                return
            }
            let newUser = User(username: username, email: email)
            DatabaseManager.shared.createUser(newUser: newUser) { isCreated in
                switch isCreated {
                    case false:
                        completion(.failure(AuthError.newUserCreation))
                    case true:
                        guard let profilePicture = profilePicture else {
                            completion(.failure(AuthError.newUserCreation))
                            return
                        }
                        StorageManager.shared.uploadProfilePhoto(username: username, photo: profilePicture) { uploadResault in
                            if uploadResault {
                                completion(.success(newUser))
                            } else {
                                completion(.failure(AuthError.newUserCreation))
                            }
                        }
                }
            }
        }
    }
    
    public func signOut(completion: @escaping (Bool) -> Void) {
        do {
            try auth.signOut()
            completion(true)
        } catch {
            print(error)
            completion(false)
        }
    }
}
