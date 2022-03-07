//
//  File.swift
//  YogaZone
//
//  Created by Marcelo Silva on 06/03/22.
//
 
enum HealthStatus:String{
    case magreza = "Magreza"
    case saudavel = "Saudavel"
    case sobrepeso = "SobrePeso"
    case obesidade = "Obesidade"
}



struct Result{
    let weight : Double
    let height : Double
    let infKg : Double
    let healthStatus : HealthStatus
    
    
    
    
}
