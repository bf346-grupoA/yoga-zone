//
//  Touchable.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 18/03/22.
//

import Foundation

protocol Selectable: AnyObject {
    func navigateTo(routeIndex: Int)
}
