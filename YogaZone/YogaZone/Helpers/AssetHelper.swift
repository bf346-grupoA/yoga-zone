//
//  AssetHelper.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 25/04/22.
//

import Foundation

class AssetHelper {
    static let images: [Int: String] = [
        1: "pose-gallery",
        2: "bmi",
        3: "breathing",
        4: "meditation",
        5: "workout",
        6: "events"
    ]
    
    static func getImageName(indexPath: IndexPath) -> String {
        let selectedSection = NavigationHelper.sections[indexPath.section]
        
        return images[selectedSection?[indexPath.row] ?? 0] ?? ""
    }
}
