//
//  NavigationHelper.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 25/04/22.
//

import Foundation
import UIKit

class NavigationHelper {
    static let firstSectionRouter: [Int: Int] = [
        0: 1,
        1: 2,
        2: 3
    ]
    
    static let secondSectionRouter: [Int: Int] = [
        0: 4
    ]
    
    static let thirdSectionRouter: [Int: Int] = [
        0:5
    ]
        
    static let sections: [Int: Dictionary<Int,Int>] = [
        0: firstSectionRouter,
        1: secondSectionRouter,
        2: thirdSectionRouter
    ]
    
    static func getDestinationIndex(indexPath: IndexPath) -> Int {
        let selectedSection = sections[indexPath.section]
        
        return selectedSection?[indexPath.row] ?? 0
    }
    
    static func getDestinationByIndex(index: Int) -> UIViewController {
        switch index {
            case 1: return PoseGalleryViewController()
            case 2: return BmiViewController()
            case 3: return LevelAndDurationVC()
            case 4: return MeditationHomeViewController()
            default: return HomeEventsViewController()
        }
    }
}
