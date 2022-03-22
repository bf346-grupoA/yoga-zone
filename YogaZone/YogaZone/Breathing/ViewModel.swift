//
//  File.swift
//  YogaZone
//
//  Created by Tadeu on 16/03/22.
//

import Foundation


class ViewModel {
    
    var sliderInhale:Int = 3
    var sliderHold:Int = 3
    var sliderExpire:Int = 3
    var sliderCicle:Int = 4
    
    
    static func getViewModel() -> ViewModel.Type{
        return self
    }
    
    
    init(sliderInhale:Int, sliderHold:Int, sliderExpire:Int, sliderCicle:Int){
        
        self.sliderInhale = sliderInhale
        self.sliderHold = sliderHold
        self.sliderExpire = sliderExpire
        self.sliderCicle = sliderCicle
        
    }
    
}
