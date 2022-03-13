//
//  Event.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 12/03/22.
//

import UIKit

struct Event: Codable {
    var id: Int
    var title: String
    var local: String
    var date: String
    var description: String
    var isOwner: Bool
    var isParticipating: Bool
    var numberOfParticipants: Int
    var maximumOfParticipants: Int
    var startTime: String
}
