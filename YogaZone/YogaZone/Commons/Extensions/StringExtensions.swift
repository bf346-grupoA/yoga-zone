//
//  StringExtension.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 01/06/22.
//

import Foundation
import UIKit

enum InputTypes {
    case email
    case password
}

extension String {
    func removeWhiteSpace() -> String {
        return self.replace(string: " ",replacement:"")
    }
    
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: .literal, range: nil)
    }
    
    enum Regex: String {
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case password = ".{6,}"
    }
    
    func isValid(inputType: InputTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch inputType {
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        }
        
        return NSPredicate(format:format, regex).evaluate(with: self)
    }
}
