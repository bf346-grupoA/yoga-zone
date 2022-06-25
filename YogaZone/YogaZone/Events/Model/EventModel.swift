//
//  EventModel.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 12/03/22.
//

import Foundation
import FirebaseFirestoreSwift

struct EventModel: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String?
    var local: String?
    var date: Date?
    var description: String?
    var isOwner: Bool?
    var isParticipating: Bool?
    var numberOfParticipants: Int?
    var maximumOfParticipants: Int?
    var startTime: String?
    var creator: String?
    var eventParticipants: [String]?

    init(){
        
    }
    
    init(id: String?, title: String, local: String, date: Date, description: String, isOwner: Bool?, isParticipating: Bool?,numberOfParticipants: Int, maximumOfParticipants: Int, startTime: String, creator: String, eventParticipants:[String]){
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
        self.creator = creator
        self.eventParticipants = eventParticipants
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
