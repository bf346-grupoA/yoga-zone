//
//  YogaParser.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 09/03/22.
//

/**
    Created to help in JSON Operations Decode
 */

import Foundation

protocol Mappleable {
    associatedtype Item
    func getListFromJson(_ type: Item.Type, source: Data) -> Decodable
}

class YogaParser {
    
}
