//
//  Router.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 17/03/22.
//

import Foundation
import UIKit

class Router {
    static let routes: [Int: UIViewController] = [
        1: HomeViewController(), // PosesViewController()
        2: HomeViewController(), // ImcViewController()
        3: HomeViewController(), // RespiracaoViewController()
        4: HomeViewController(), // MeditcacaoViewController()
        5: HomeViewController(), // TreinosViewController()
        6: HomeViewController() // EventosViewController()
    ]
    
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
    
    static let sections: [Int: Dictionary] = [
        0: firstSectionRouter,
        1: secondSectionRouter,
        2: thirdSectionRouter
    ]
    
    static func getImageName(indexPath: IndexPath) -> String {
        let selectedSection = sections[indexPath.section]
        
        return images[selectedSection?[indexPath.row] ?? 0] ?? ""
    }
    
    
    static func getDestination(indexPath: IndexPath) -> UIViewController {
        let selectedSection = sections[indexPath.section]
        
        return routes[selectedSection?[indexPath.row] ?? 0] ?? HomeViewController()
    }
}
