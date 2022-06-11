//
//  UserPreferencesProtocol.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 06/06/22.
//

import Foundation

protocol UserPreferencesProtocol {
    func store(key: String, value: String)
    func store(key: String, value: Int)
    func store(key: String, value: Float)
    func store(key: String, value: Bool)
    func store(key: String, value: [String: String])
    func retrieve(key: String) -> String
    func retrieve(key: String) -> Int
    func retrieve(key: String) -> Float
    func retrieve(key: String) -> Bool
    func retrieve(key: String) -> [String: String]
}

extension UserPreferencesProtocol {
    
    func store(key: String, value: String) {
        // Intentionally Unimplemented
    }
    
    func store(key: String, value: Int) {
        // Intentionally Unimplemented
    }
    
    func store(key: String, value: Float) {
        // Intentionally Unimplemented
    }
    
    func store(key: String, value: Bool) {
        // Intentionally Unimplemented
    }
    
    func store(key: String, value: [String: String]) {
        // Intentionally Unimplemented
    }
    
    func retrieve(key: String) -> String {
        return String()
    }
    
    func retrieve(key: String) -> Int {
        return Int()
    }
    
    func retrieve(key: String) -> Float {
        return Float()
    }
    
    func retrieve(key: String) -> Bool {
        return Bool()
    }
    
    func retrieve(key: String) -> [String: String] {
        return [String(): String()]
    }
    
}
