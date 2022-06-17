//
//  DeleteAccountVC.swift
//  YogaZone
//
//  Created by Marcus on 13/03/22.
//

import UIKit
import FirebaseAuth

class DeleteAccountVC: UIViewController {
    
    
    @IBOutlet weak var deleteAccountLabel: UILabel!
    
    @IBOutlet weak var displayTextFieldSwitch: UISwitch!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var confirmDeleteAccountButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    var alert: AlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.alert = AlertController(controller: self)
        
        configDeleteAccountButton()
        
        self.confirmPasswordTextField.delegate = self
        self.confirmPasswordTextField.isHidden = true
        
        self.confirmDeleteAccountButton.isHidden = true
        self.confirmDeleteAccountButton.isEnabled = false
        
        self.displayTextFieldSwitch.setOn(false, animated: false)
        
        self.deleteAccountLabel.font = UIFont(name: CommonConstants.comfortaaMediumFont.rawValue, size: 20)
        
        self.cancelButton.setTitle("Cancelar", for: .normal)
        
        self.confirmPasswordTextField.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.confirmPasswordTextField.placeholder =  ProfileConstants.informConfirmPasswordPlaceholder.rawValue
        self.confirmPasswordTextField.layer.cornerRadius = 6
        self.confirmPasswordTextField.minimumFontSize = 8
        self.confirmPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.confirmPasswordTextField.layer.borderWidth = 0.5
        self.confirmPasswordTextField.textAlignment = .left
        self.confirmPasswordTextField.isSecureTextEntry = true
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
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
        
        guard let user = Auth.auth().currentUser else {return}
        guard let email = user.email else {return}
        var credential: AuthCredential
        credential = EmailAuthProvider.credential(withEmail: email, password: confirmPasswordTextField.text ?? "")

        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            user.reauthenticate(with: credential, completion: { (result, error) in
                if let err = error {
                    print(err.localizedDescription)
                    self.alert?.setup(title: LoginConstants.ops.rawValue, message: "Senha atual incorreta", okText: LoginConstants.ok.rawValue)
                } else {
                    user.delete { error in
                        if let error = error {
                            print(error.localizedDescription)
                            self.alert?.setup(title: LoginConstants.ops.rawValue, message: "Erro ao tentar excluir usuário", okText: LoginConstants.ok.rawValue)
                        } else {
                            print("User deleted")
                            CustomAlertVC.instance.showAlert(titleType: .success, message: "Sua conta foi excluida com sucesso !", alertType: .success)
                            CustomAlertVC.instance.delegate(delegate: self)                            
                        }
                    }
                }
            })
        }
        
        
        
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
}

//MARK: - CustomAlert Delegate
extension DeleteAccountVC: customAlertDelegate {
    
    func okPressed() {
        let rootViewController = UINavigationController(rootViewController: LoginViewController())
        self.view.window?.rootViewController = rootViewController
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

//MARK: - DeleteAccount
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

