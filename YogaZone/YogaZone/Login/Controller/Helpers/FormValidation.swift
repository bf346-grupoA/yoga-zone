//
//  FormDelegate.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import Foundation


protocol FormDelegate: AnyObject {
    func send(userData: UserData)
}
