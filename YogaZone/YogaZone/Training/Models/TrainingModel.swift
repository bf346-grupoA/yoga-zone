//
//  CityModel.swift
//  MakeDropDown
//
//  Created by Marcus on 20/03/22.
//

import Foundation
import UIKit

struct DurationModel {
    var durationName: String
}

struct LevelModel {
    var levelName: String
}

struct ExercicesModel: Codable {
    var id: Int?
    var exercise: String?
    var seconds: String?
}
