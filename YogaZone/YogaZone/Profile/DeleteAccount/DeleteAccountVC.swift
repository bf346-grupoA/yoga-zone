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
        
        configButtonsApperance()
        
        self.confirmPasswordTextField.delegate = self
        self.confirmPasswordTextField.isHidden = true
        
        self.confirmDeleteAccountButton.isHidden = true
        self.confirmDeleteAccountButton.isEnabled = false
        
        self.displayTextFieldSwitch.setOn(false, animated: false)
    }
    
    func configButtonsApperance(){
        confirmDeleteAccountButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
        confirmDeleteAccountButton.clipsToBounds = true // Rounded 🙂
        confirmDeleteAccountButton.layer.cornerRadius = 7.5
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
        // CONTA DELETADA
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

