//
//  ViewModel.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 04/06/22.
//

import Foundation

protocol OnboardingViewModelDelegate:AnyObject {
    func success()
    func error(error: Error)
}

class OnboardingViewModel{
    
    private weak var delegate:OnboardingViewModelDelegate?
    
    public func delegate(delegate:OnboardingViewModelDelegate) {
        self.delegate = delegate
    }
    
    private let service:OnboardingService = OnboardingService()
    
    private var stateData:[BrazilianState] = []
    
    public func getRequestBrazilianState(){
        self.service.getBrazilianState { success, error in
            if let success = success {
                self.stateData = success
                self.delegate?.success()
            } else {
                self.delegate?.error(error: Error.errorDescription(message: "Error obtaining state data", error: error))
            }
        }
    }
    
    public var countTotalStates:Int{
        return stateData.count
    }
    
    public func getLoadedStates(row: Int) -> String {
        return self.stateData[row].sigla ?? ""
    }
    
}
