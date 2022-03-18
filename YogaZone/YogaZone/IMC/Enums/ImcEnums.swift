//
//  ImcEnums.swift
//  YogaZone
//
//  Created by Marcelo Silva on 10/03/22.
//

import Foundation
import UIKit


enum HealthStatus:String{
    case magreza = "Magreza"
    case saudavel = "Saudavel"
    case sobrepeso = "SobrePeso"
    case obesidade = "Obesidade"
}
    
enum PossibleConsequences:String{
    case magreza = "Estresse, Ansiedade,Fadiga"
    case saudavel = "Menor risco para Doenças"
    case sobrepeso = "Fadiga, Varizes, Má Circulação"
    case obesidade = "Diabetes, Infarto, AVC"
}
enum ImcNumber: Double{
    case magreza = 18.4
    case saudavelMinimum = 18.5
    case saudavelMaximum = 25.9
    case sobrepesoMinimum = 26
    case sobrepesoMaximum = 29.9
    case Obesidade = 30
}
    
enum ImcIndex: Int {
    case IndexMgreza = 1
    case IndexSaudadel = 2
    case IndexSobrepeso = 3
    case IndexObesidade = 4
}

    

