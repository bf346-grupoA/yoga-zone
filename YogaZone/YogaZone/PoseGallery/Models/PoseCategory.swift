//
//  PoseCategory.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 12/03/22.
//

import Foundation

struct PoseCategory: Codable {
    var id: Int
    var name: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
    }
}
