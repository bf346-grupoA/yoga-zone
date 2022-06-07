//
//  AlertService.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 15/03/22.
//

import UIKit

class AlertService {
    
    func alert(parentVC: UIViewController, alertTitle: String, alertDescription: String, cancelText: String, confirmText: String, actionType: String) -> AlertViewController {
       
        let storyboard = UIStoryboard(name: "Alert", bundle: nil)
        let alertVC = storyboard.instantiateViewController(identifier: "AlertViewController") as AlertViewController
        
        alertVC.alertTitle = alertTitle
        alertVC.alertDescritpiton = alertDescription
        alertVC.cancelText = cancelText
        alertVC.confirmText = confirmText
        alertVC.actionType = actionType
        alertVC.parentVC = parentVC
        
        alertVC.modalTransitionStyle = .crossDissolve
        alertVC.modalPresentationStyle = .overFullScreen
        
        return alertVC
        
    }
}
