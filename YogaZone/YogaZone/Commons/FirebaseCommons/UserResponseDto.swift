//
//  UserResponseDto.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 10/06/22.
//

import Foundation
import FirebaseAuth

protocol YZError: Swift.Error { }

struct UserResponseDto: YZError {
    var user: User
}
