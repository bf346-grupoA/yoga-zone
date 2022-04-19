//
//  DeleteAccountVC.swift
//  YogaZone
//
//  Created by Marcus on 13/03/22.
//

import UIKit

class DeleteAccountVC: UIViewController {

    @IBOutlet weak var deleteAccountLabel: UILabel!
    
    @IBOutlet weak var displayTextFieldSwitch: UISwitch!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var confirmDeleteAccountButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configDeleteAccountButton()
        
        self.confirmPasswordTextField.delegate = self
        self.confirmPasswordTextField.isHidden = true
        
        self.confirmDeleteAccountButton.isHidden = true
        self.confirmDeleteAccountButton.isEnabled = false
        
        self.displayTextFieldSwitch.setOn(false, animated: false)
    }
    
    func configDeleteAccountButton(){
        var containerTitle = AttributeContainer()
            containerTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        
        var configSaveChangesButton = UIButton.Configuration.filled()
            configSaveChangesButton.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
            configSaveChangesButton.baseForegroundColor = .white
            configSaveChangesButton.attributedTitle = AttributedString("Confirmar", attributes: containerTitle)
        
        self.confirmDeleteAccountButton.configuration = configSaveChangesButton
        self.confirmDeleteAccountButton.layer.cornerRadius = 8
    }
    
    @IBAction func actionDisplayTextFieldSwitch(_ sender: UISwitch) {
        if displayTextFieldSwitch.isOn {
            self.confirmPasswordTextField.isHidden = false
            self.confirmDeleteAccountButton.isHidden = false
        } else {
            self.confirmPasswordTextField.isHidden = true
            self.confirmDeleteAccountButton.isHidden = true
        }
    }
    
    @IBAction func tappedConfirmDeleteAccountButton(_ sender: UIButton) {
        CustomAlertVC.instance.showAlert(titleType: .success, message: "Sua conta foi excluida com sucesso !", alertType: .success)
    }
}


extension DeleteAccountVC:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if self.confirmPasswordTextField.text != "" {
            self.confirmDeleteAccountButton.isEnabled = true
        } else {
            self.confirmDeleteAccountButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

