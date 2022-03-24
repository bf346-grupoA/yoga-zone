//
//  Router.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 17/03/22.
//

import Foundation
import UIKit

class Router {
    static let firstSectionRouter: [Int: Int] = [
        0: 1,
        1: 2,
        2: 3
    ]
    
    static let secondSectionRouter: [Int: Int] = [
        0: 4,
        1: 5
    ]
    
    static let thirdSectionRouter: [Int: Int] = [
        0: 6
    ]
    
    static let images: [Int: String] = [
        1: "poses",
        2: "imc",
        3: "respiracao",
        4: "meditacao",
        5: "treinos",
        6: "eventos"
    ]
    
    static let sections: [Int: Dictionary<Int,Int>] = [
        0: firstSectionRouter,
        1: secondSectionRouter,
        2: thirdSectionRouter
    ]
    
    static func getImageName(indexPath: IndexPath) -> String {
        let selectedSection = sections[indexPath.section]
        
        return images[selectedSection?[indexPath.row] ?? 0] ?? ""
    }
    
    static func getDestinationIndex(indexPath: IndexPath) -> Int {
        let selectedSection = sections[indexPath.section]
        
        return selectedSection?[indexPath.row] ?? 0
    }
    
    static func getDestinationByIndex(index: Int) -> UIViewController {
        switch index {
            case 1: return PoseGalleryViewController()
            case 2: return ImcController()
            case 3: return BreathingHomeViewController()
            case 4: return MeditacaoHomeViewController()
            case 5: return MeditacaoHomeViewController()
            default: return HomeEventsViewController()
        }
    }
}
