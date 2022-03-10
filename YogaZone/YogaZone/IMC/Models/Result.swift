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
    
    
enum possibleConsequences:String{
    case magreza = "Estresse, ansiedade,fadiga"
    case saudavel = "Menor risco para doenças"
    case sobrepeso = "Fadiga, varizes, má circulação"
    case obesidade = "Diabetes, infarto, AVC"
    
enum imcNumber: String{
    case magreza = "<18.5"
    case saudavel = "18.5 a 25.9"
    case sobrepeso = "25 a 29.9"
    case Obesidade = ">29.9"
        

 
        
    }
    
    
   


}
}



struct Result{
    let weight : Double
    let height : Double
    let infKg : Double
    let healthStatus : HealthStatus
    
    
    
    
}
