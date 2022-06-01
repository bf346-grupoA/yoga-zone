//
//  BmiEnum.swift
//  BmiX
//
//  Created by Marcelo Silva on 22/04/22.
//

import Foundation
import UIKit

enum BmiNumber: Double{
    case underWeight = 18.4
    case normalMinimum = 18.5
    case normalMaximum = 24.9
    case overWeightMinimum = 25
    case overWeightMaximum = 29.9
    case obeseWeightMinimum = 30
    case obeseWeightMaximum = 34.9
    case extremelyObese = 35
}

enum PossibleConsequences:String{
    case underWeight = "Estresse, Ansiedade,Fadiga"
    case normal = "Menor risco para Doenças"
    case overWeight = "Fadiga, Varizes, Má Circulação"
    case obese = "Diabetes, Infarto, AVC"
    case extremelyObese = "AVC"
}

enum PicImage: String{
    case underWeight = "Underweight"
    case normal = "Normal"
    case overWeight = "OverWeight"
    case obese = "Obese"
    case extremelyObese = "ExtremelyObese"
}

enum CaseIndex: String {
    case underWeight = "Abaixo do peso"
    case normal = "Normal"
    case overWeight = "Acima do peso"
    case obese = "Obese"
    case extremelyObese = "Extremamente Obeso"
}

enum NumberIndex: String {
    case underWeight = "<18,5"
    case normal = "18,5 - 24,9"
    case overWeight = "25 - 29,9"
    case obese = "30 - 34,9"
    case extremelyObese = ">35,0"
}

