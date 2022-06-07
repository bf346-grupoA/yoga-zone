//
//  FormDelegate.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import Foundation

protocol FormDataDelegate: AnyObject {
    func send(userData: UserData)
    func isValidEmail(email: String) -> Bool
    func isValidPasswordLenght(password: String) -> Bool
}

extension FormDataDelegate {
    
    func isValidEmail(email: String) -> Bool {
        return email.isValid(inputType: .email)
    }
    
    func isValidPasswordLenght(password: String) -> Bool {
        return password.isValid(inputType: .password)
    }
    
}
