//
//  AlertViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 15/03/22.
//

import UIKit

class AlertViewController: UIViewController {
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cancelButtonLabel: UIButton!
    @IBOutlet weak var confirmButtonLabel: UIButton!
    
    var alertTitle = ""
    var alertDescritpiton = ""
    var cancelText = ""
    var confirmText = ""
    var actionType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        if actionType == "Exclusão"{
            //Tela sucesso exclusao
        } else if actionType == "Cancelamento"{
            //Tela sucesso cancelamento
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

// MARK: UI Functions
extension AlertViewController {
    func setupUI(){
        self.alertView.layer.cornerRadius = 8
        self.alertView.layer.borderWidth = 1
        self.titleLabel.text = self.alertTitle
        self.descriptionLabel.text = self.alertDescritpiton
        self.cancelButtonLabel.setTitle( self.cancelText, for: .normal)
        self.confirmButtonLabel.setTitle( self.confirmText, for: .normal)
    }
    
}
