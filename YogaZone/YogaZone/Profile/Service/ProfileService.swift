//
//  ProfileService.swift
//  YogaZone
//
//  Created by Marcus on 10/06/22.
//

import Foundation

protocol GenericProfileService:AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum ErrorPRo:Swift.Error {
    case errorDescription(message:String, error: Swift.Error? = nil)
}

protocol ProfileServiceDelegate:GenericProfileService {
    func getBrazilianState(completion: @escaping completion<[BrazilianState]?>)
    func getBrazilianCity(state: String, completion: @escaping completion<[BrazilianCity]?>)
}

class ProfileService:ProfileServiceDelegate{
    
    func getBrazilianState(completion: @escaping completion<[BrazilianState]?>) {
        
        let urlString:String = "https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome"
        
        guard let url:URL = URL(string: urlString) else {return completion(nil,Error.errorDescription(message: "Error Creating URL"))}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let dataResult = data else{return completion(nil,Error.errorDescription(message: "Error removing data opcionality"))}
            
            //let json = try? JSONSerialization.jsonObject(with: dataResult)
            //print(json as Any)
            
            guard let response = response as? HTTPURLResponse else{return completion(nil,Error.errorDescription(message: "Error conerting to HTTPURLResponse"))}
            if response.statusCode == 200{
                do {
                    let model:[BrazilianState] = try JSONDecoder().decode([BrazilianState].self, from: dataResult)
                    completion(model,nil)
                } catch {
                    completion(nil,Error.errorDescription(message: "Error during parsing", error: error))
                }
            }else{
                completion(nil,Error.errorDescription(message: "Error in response", error: error))
            }
        }
        task.resume()
    }
    
    func getBrazilianCity(state: String, completion: @escaping completion<[BrazilianCity]?>) {
        
        let urlString:String = "https://servicodados.ibge.gov.br/api/v1/localidades/estados/\(state)/municipios"

        guard let url:URL = URL(string: urlString) else {return completion(nil,Error.errorDescription(message: "Error Creating URL"))}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let dataResult = data else{return completion(nil,Error.errorDescription(message: "Error removing data opcionality"))}
            
            //let json = try? JSONSerialization.jsonObject(with: dataResult)
            //print(json as Any)
            
            guard let response = response as? HTTPURLResponse else{return completion(nil,Error.errorDescription(message: "Error conerting to HTTPURLResponse"))}
            if response.statusCode == 200{
                do {
                    let model:[BrazilianCity] = try JSONDecoder().decode([BrazilianCity].self, from: dataResult)
                    completion(model,nil)
                } catch {
                    completion(nil,Error.errorDescription(message: "Error during parsing", error: error))
                }
            }else{
                completion(nil,Error.errorDescription(message: "Error in response", error: error))
            }
        }
        task.resume()
    }
}
