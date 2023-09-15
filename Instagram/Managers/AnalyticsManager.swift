//
//  AnalyticsManager.swift
//  Instagram
//
//  Created by Mohammad Afshar on 15/09/2023.
//

import Foundation
import FirebaseAnalytics

final class AnalyticsManager {
    static let shared = AnalyticsManager()
    
    private init() {}
    
    func logEvent() {
        Analytics.logEvent("", parameters: [:])
    }
}
