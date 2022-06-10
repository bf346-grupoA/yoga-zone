//
//  FormInputDelegate.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 09/06/22.
//

import Foundation

protocol FormInputDelegate: AnyObject {
    func getUser(user: UserRegistrationModel)
    func submit()
}
