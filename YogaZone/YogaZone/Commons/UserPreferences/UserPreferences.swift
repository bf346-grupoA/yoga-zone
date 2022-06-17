//
//  UserPreferences.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 06/06/22.
//

import Foundation

class UserPreferences: UserPreferencesProtocol {
    let userDefaults: UserDefaults = UserDefaults.standard
    
    func store(key: String, value: String) {
        self.userDefaults.set(value, forKey: key)
    }
    
    func store(key: String, value: Int) {
        self.userDefaults.set(value, forKey: key)
    }
    
    func store(key: String, value: Bool) {
        self.userDefaults.set(value, forKey: key)
    }
    
}
