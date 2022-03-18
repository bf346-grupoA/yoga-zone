//
//  Pose.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 12/03/22.
//

import Foundation

struct Pose: Codable {
    var id: Int
    var name: String
    var categories: [PoseCategory]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "sanskrit_name"
        case categories = "yoga_categories"
    }
}
