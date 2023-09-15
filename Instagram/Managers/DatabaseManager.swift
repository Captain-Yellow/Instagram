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
}
