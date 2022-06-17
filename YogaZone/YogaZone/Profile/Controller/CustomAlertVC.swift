//
//  CustomAlertVC.swift
//  YogaZone
//
//  Created by Marcus on 13/03/22.
//

import Foundation
import UIKit

protocol customAlertDelegate:AnyObject {
    func okPressed()
}

class CustomAlertVC: UIView {
 
    @IBOutlet var parentView: UIView!
    
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    weak private var delegate: customAlertDelegate?
    static let instance = CustomAlertVC()
    
    func delegate(delegate: customAlertDelegate?) {
        self.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CustomAlertVC", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        img.layer.cornerRadius = 30
        img.layer.borderColor = UIColor.white.cgColor
        img.layer.borderWidth = 2
        
        alertView.layer.cornerRadius = 10
        
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    enum AlertType {
        case success
        case failure
    }
    
    enum TitleType {
        case success
        case failure
    }
    
    func showAlert(titleType: TitleType, message:String, alertType: AlertType) {
        
        self.messageLabel.text = message
        switch alertType {
        case .success:
            img.image = UIImage(named: "successIcon")
            titleLabel.text = "Sucesso"
        case .failure:
            img.image = UIImage(named: "errorIcon")
            titleLabel.text = "Tente novamente"
        }
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        windowScene?.windows.first{$0.isKeyWindow}?.addSubview(parentView)
    }
    
    @IBAction func tappedOkButton(_ sender: UIButton) {
        parentView.removeFromSuperview()
        self.delegate?.okPressed()
    }
}
