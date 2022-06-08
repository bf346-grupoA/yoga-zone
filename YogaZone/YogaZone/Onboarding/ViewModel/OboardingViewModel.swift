//
//  ViewModel.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 04/06/22.
//

import Foundation

protocol OnboardingViewModelDelegate:AnyObject {
    func success(serviceType: serviceType)
    func error(error: Error)
}

enum serviceType {
    case getState
    case getCity
}

class OnboardingViewModel{
    
    private weak var delegate:OnboardingViewModelDelegate?
    
    public func delegate(delegate:OnboardingViewModelDelegate) {
        self.delegate = delegate
    }
    
    private let service:OnboardingService = OnboardingService()
    
    private var stateData:[BrazilianState] = []
    private var cityData:[BrazilianCity] = []
    
    public func getRequestBrazilianState(){
        self.service.getBrazilianState { success, error in
            if let success = success {
                self.stateData = success
                self.delegate?.success(serviceType: serviceType.getState)
            } else {
                self.delegate?.error(error: Error.errorDescription(message: OnboardingConstants.badCityRequestError.rawValue, error: error))
            }
        }
    }
    
    public func getRequestBrazilianCity(state: String){
        self.service.getBrazilianCity(state: state) { success, error in
            if let success = success {
                self.cityData = success
                self.delegate?.success(serviceType: serviceType.getCity)
            } else {
                self.delegate?.error(error: Error.errorDescription(message: OnboardingConstants.badCityRequestError.rawValue, error: error))
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
