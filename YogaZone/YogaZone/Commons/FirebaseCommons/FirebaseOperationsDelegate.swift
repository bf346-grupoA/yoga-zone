//
//  FirebaseOperationsDelegate.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 01/06/22.
//

import Foundation

protocol FirebaseOperationsDelegate: AnyObject {
    func login()
    func register()
    func resetPassword(newPassword: String)
}

extension FirebaseOperationsDelegate {
    func login() {
        // Intentionally Unimplemented
    }
    
    func register() {
        // Intentionally Unimplemented
    }
    
    func resetPassword(newPassword: String) {
        // Intentionally Unimplemented
    }
}
