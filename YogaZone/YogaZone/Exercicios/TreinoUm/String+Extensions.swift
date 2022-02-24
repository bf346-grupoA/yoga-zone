//
//  String+Extensions.swift
//  YogaZone
//
//  Created by Marcus on 21/02/22.
//

import Foundation
import SwiftyMenu

extension String: SwiftyMenuDisplayable {
    public var displayableValue: String {
        return self
    }

    public var retrievableValue: Any {
        return self
    }
}
