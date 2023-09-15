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
    let storage = Storage.storage()
    
    private init() {}
}
