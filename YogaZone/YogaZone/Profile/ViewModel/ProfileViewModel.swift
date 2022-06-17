//
//  ProfileViewModel.swift
//  YogaZone
//
//  Created by Marcus on 10/06/22.
//

import Foundation

protocol ProfileViewModelDelegate:AnyObject {
    func success(serviceType: ServiceType)
    func error(error: Error)
}

enum ServiceType {
    case getState
    case getCity
}

class ProfileViewModel{
    
    private weak var delegate:ProfileViewModelDelegate?
    
    public func delegate(delegate:ProfileViewModelDelegate) {
        self.delegate = delegate
    }
    
    private let service:ProfileService = ProfileService()
    
    private var stateData:[BrazilianState] = []
    private var cityData:[BrazilianCity] = []
    
    public func getRequestBrazilianState(){
        self.service.getBrazilianState { success, error in
            if let success = success {
                self.stateData = success
                self.delegate?.success(serviceType: ServiceType.getState)
            } else {
                self.delegate?.error(error: Error.errorDescription(message: ProfileConstants.badCityRequestError.rawValue, error: error))
            }
        }
    }
    
    public func getRequestBrazilianCity(state: String){
        self.service.getBrazilianCity(state: state) { success, error in
            if let success = success {
                self.cityData = success
                self.delegate?.success(serviceType: ServiceType.getCity)
            } else {
                self.delegate?.error(error: Error.errorDescription(message: ProfileConstants.badCityRequestError.rawValue, error: error))
            }
        }
    }
    
    public var countTotalStates:Int{
        return stateData.count
    }
    
    public func getLoadedStates(row: Int) -> String {
        return self.stateData[row].sigla ?? ""
    }
    
    public var countTotalCities:Int{
        return cityData.count
    }
    
    public func getLoadedCities(row: Int) -> String {
        return self.cityData[row].nome ?? ""
    }
    
}
