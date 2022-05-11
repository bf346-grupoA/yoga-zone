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
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    var alertTitle = ""
    var alertDescritpiton = ""
    var cancelText = ""
    var confirmText = ""
    var actionType = ""
    var parentVC = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        let vc = EventCreatedSuccessViewController()
        
        if actionType == "Exclusão"{
            
            vc.titleText = "Evento Exclúido"
            vc.sucessMessage = """
         Evento excluído com sucesso !
         """
            
            self.dismiss(animated: true, completion: {
                self.parentVC.navigationController?.pushViewController(vc, animated: false)
            })
            
        } else if actionType == "Cancelamento"{
            
            vc.titleText = "Participação Cancelada"
            vc.sucessMessage = """
         Sua participação foi cancelada com sucesso !
         """
            
            self.dismiss(animated: true, completion: {
                self.parentVC.navigationController?.pushViewController(vc, animated: false)
            })
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
        
        self.cancelButton.layer.cornerRadius = 8
        self.cancelButton.layer.borderWidth = 1
        self.cancelButton.layer.borderColor = UIColor.black.cgColor
        self.cancelButton.layer.maskedCorners = [.layerMinXMaxYCorner] //Aplica a mascara de borda apenas para o canto inferior esquerdo
        self.cancelButton.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 20)
        self.cancelButton.titleLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.confirmButton.layer.cornerRadius = 8
        self.confirmButton.layer.borderWidth = 1
        self.confirmButton.layer.borderColor = UIColor.black.cgColor
        self.confirmButton.layer.maskedCorners = [.layerMaxXMaxYCorner] //Aplica a mascara de borda apenas para o canto inferior direito
        self.confirmButton.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 20)
        self.confirmButton.titleLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.confirmButton.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.07843137255, blue: 0.07843137255, alpha: 1)
        
        self.titleLabel.font = UIFont(name: "Comfortaa-Regular", size: 20)
        self.titleLabel.textColor = #colorLiteral(red: 0.831372549, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
        self.descriptionLabel.font = UIFont(name: "Comfortaa-Regular", size: 16)
        self.descriptionLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.titleLabel.text = self.alertTitle
        self.descriptionLabel.text = self.alertDescritpiton
        self.cancelButton.setTitle( self.cancelText, for: .normal)
        self.confirmButton.setTitle( self.confirmText, for: .normal)
        
    }
    
}
