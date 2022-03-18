//
//  NumericExtensions.swift
//  YogaZone
//
//  Created by Marcelo Silva on 10/03/22.
//

import Foundation
extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
