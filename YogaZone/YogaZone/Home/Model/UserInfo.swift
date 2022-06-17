//
//  UserInfo.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 10/06/22.
//

import Foundation
import UIKit


 
// MARK: Esse UserInfo vai ser utilzado para passar info para o Header na Home. futuramente poderá conter mais params.
struct UserInfo : YZError {
    var username: String
    var avatar: UIImage?
}
