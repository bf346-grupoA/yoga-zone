//
//  AssetHelper.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 25/04/22.
//

import Foundation

class AssetHelper {
    static let images: [Int: String] = [
        1: "poses",
        2: "imc",
        3: "treinos",
        4: "meditacao",
        5: "eventos"
    ]
    
    static func getImageName(indexPath: IndexPath) -> String {
        let selectedSection = NavigationHelper.sections[indexPath.section]
        
        return images[selectedSection?[indexPath.row] ?? 0] ?? ""
    }
}
