//
//  EventModel.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 12/03/22.
//

import UIKit

struct EventModel: Codable {
    var id: Int
    var title: String
    var local: String
    var date: Date
    var description: String
    var isOwner: Bool
    var isParticipating: Bool
    var numberOfParticipants: Int
    var maximumOfParticipants: Int
    var startTime: String
    
    init(id: Int, title: String, local: String, date: Date, description: String, isOwner: Bool, isParticipating: Bool,
         numberOfParticipants: Int, maximumOfParticipants: Int, startTime: String){
        self.id = id
        self.title = title
        self.local = local
        self.date = date
        self.description = description
        self.isOwner = isOwner
        self.isParticipating = isParticipating
        self.numberOfParticipants = numberOfParticipants
        self.maximumOfParticipants = maximumOfParticipants
        self.startTime = startTime
    }
}

extension Formatter {
    static let dateFormatterPtBr: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        df.locale = Locale(identifier: "pt_BR")
        return df
    }()
}
