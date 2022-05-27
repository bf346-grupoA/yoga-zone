//
//  EventFilter.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 19/05/22.
//

import Foundation

struct EventFilter: Codable {
    var title: String?
    var local: String?
    var startDate: Date?
    var endDate: Date?
    var isOwner: Bool?
    var isFinalized: Bool?
}
