//
//  AlterarSenhaVC.swift
//  YogaZone
//
//  Created by Marcus on 09/03/22.
//

import UIKit
import FirebaseAuth

class MoreOptionsVC: UIViewController, UIGestureRecognizerDelegate{
    
    @IBOutlet weak var changePasswordTitleLabel: UILabel!
    
    @IBOutlet weak var currentPasswordTextField: UITextField!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var excludeAccountButton: UIButton!
    
    @IBOutlet weak var leaveAppButton: UIButton!
    
    @IBOutlet weak var newPasswordErrorLabel: UILabel!
    
    @IBOutlet weak var confirmPasswordErrorLabel: UILabel!
    
    var alert: AlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveButton.isEnabled = true
        self.setupUIButtons()
        self.setupNavigationBar()
        self.configTextFields()
        self.configLabels()
        self.alert = AlertController(controller: self)
    }
    
}

//MARK: - Actions
extension MoreOptionsVC {
    @IBAction func tappedSaveNewPasswordButton(_ sender: UIButton) {
        
        guard let user = Auth.auth().currentUser else {return}
        guard let email = user.email else {return}
        var credential: AuthCredential
        credential = EmailAuthProvider.credential(withEmail: email, password: currentPasswordTextField.text ?? "")
        
        user.reauthenticate(with: credential, completion: { (result, error) in
            if let err = error {
                
                print(err.localizedDescription)
                self.alert?.setup(title: LoginConstants.ops.rawValue, message: "Senha atual incorreta", okText: LoginConstants.ok.rawValue)
                
            } else {
                
                print("Correct current password")
                user.updatePassword(to: self.newPasswordTextField.text ?? "") { error in
                    if error != nil {
                        print(error?.localizedDescription ?? "")
                        self.alert?.setup(title: LoginConstants.ops.rawValue, message: "Erro ao salvar nova senha", okText: LoginConstants.ok.rawValue)
                    } else {
                        print("Password changed with success")
                        CustomAlertVC.instance.showAlert(titleType: .success, message: "Sua senha foi salva com sucesso !", alertType: .success)
                        CustomAlertVC.instance.delegate(delegate: self)
                        
                    }
                }
            }
        })
        
    }
    
    @IBAction func tappedDeleteAccountButton(_ sender: UIButton) {
        let vcDeleteAccount = DeleteAccountVC()
        if let sheet = vcDeleteAccount.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        self.present(vcDeleteAccount, animated: true, completion: nil)
    }
    
    @IBAction func leaveAppButton(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            
            let rootViewController = UINavigationController(rootViewController: LoginViewController())
            self.view.window?.rootViewController = rootViewController
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
    }
}

//MARK: - UI Setup
extension MoreOptionsVC {
    func configTextFields(){
        self.currentPasswordTextField.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.currentPasswordTextField.placeholder = ProfileConstants.informCurrentPasswordPlaceholder.rawValue
        self.currentPasswordTextField.layer.cornerRadius = 6
        self.currentPasswordTextField.minimumFontSize = 8
        self.currentPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.currentPasswordTextField.layer.borderWidth = 0.5
        self.currentPasswordTextField.sizeToFit()
        self.currentPasswordTextField.textAlignment = .left
        self.currentPasswordTextField.isSecureTextEntry = true
        
        self.newPasswordTextField.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.newPasswordTextField.placeholder = ProfileConstants.informNewPasswordPlaceholder.rawValue
        self.newPasswordTextField.layer.cornerRadius = 6
        self.newPasswordTextField.minimumFontSize = 8
        self.newPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.newPasswordTextField.layer.borderWidth = 0.5
        self.newPasswordTextField.sizeToFit()
        self.newPasswordTextField.textAlignment = .left
        self.newPasswordTextField.isSecureTextEntry = true
        
        self.confirmNewPasswordTextField.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.confirmNewPasswordTextField.placeholder =  ProfileConstants.informConfirmNewPasswordPlaceholder.rawValue
        self.confirmNewPasswordTextField.layer.cornerRadius = 6
        self.confirmNewPasswordTextField.minimumFontSize = 8
        self.confirmNewPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.confirmNewPasswordTextField.layer.borderWidth = 0.5
        self.confirmNewPasswordTextField.sizeToFit()
        self.confirmNewPasswordTextField.textAlignment = .left
        self.confirmNewPasswordTextField.isSecureTextEntry = true
        
        self.currentPasswordTextField.delegate = self
        self.newPasswordTextField.delegate = self
        self.confirmNewPasswordTextField.delegate = self
    }
    
    func configLabels(){
        self.newPasswordErrorLabel.isHidden = true
        self.newPasswordErrorLabel.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 12)
        self.newPasswordErrorLabel.textColor = #colorLiteral(red: 0.9764705882, green: 0.1450980392, blue: 0.1450980392, alpha: 1)
        
        self.confirmPasswordErrorLabel.isHidden = true
        self.confirmPasswordErrorLabel.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 12)
        self.confirmPasswordErrorLabel.textColor = #colorLiteral(red: 0.9764705882, green: 0.1450980392, blue: 0.1450980392, alpha: 1)
    }
    
    func configExcludeButton(){
        var containerTitle = AttributeContainer()
        containerTitle.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        
        var configSaveChangesButton = UIButton.Configuration.filled()
        configSaveChangesButton.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        configSaveChangesButton.baseForegroundColor = .white
        configSaveChangesButton.attributedTitle = AttributedString("Excluir Conta", attributes: containerTitle)
        
        self.excludeAccountButton.configuration = configSaveChangesButton
        self.excludeAccountButton.layer.cornerRadius = 8
    }
    
    func configSavePasswordButtonDisabled(){
        var containerTitle = AttributeContainer()
        containerTitle.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        
        var configSaveChangesButton = UIButton.Configuration.filled()
        configSaveChangesButton.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        configSaveChangesButton.baseForegroundColor = .white
        configSaveChangesButton.attributedTitle = AttributedString("Salvar Senha", attributes: containerTitle)
        
        self.saveButton.isEnabled = false
        self.saveButton.configuration = configSaveChangesButton
        self.saveButton.layer.cornerRadius = 8
    }
    
    func configSavePasswordButtonEnabled(){
        var containerTitle = AttributeContainer()
        containerTitle.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        
        var configSaveChangesButton = UIButton.Configuration.filled()
        configSaveChangesButton.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        configSaveChangesButton.baseForegroundColor = .white
        configSaveChangesButton.attributedTitle = AttributedString("Salvar Senha", attributes: containerTitle)
        
        self.saveButton.isEnabled = true
        self.saveButton.configuration = configSaveChangesButton
        self.saveButton.layer.cornerRadius = 8
    }
    
    func configLeaveAppButton(){
        var containerTitle = AttributeContainer()
        containerTitle.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        
        var configSaveChangesButton = UIButton.Configuration.filled()
        configSaveChangesButton.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        configSaveChangesButton.baseForegroundColor = .white
        configSaveChangesButton.attributedTitle = AttributedString("Sair do Aplicativo", attributes: containerTitle)
        
        self.leaveAppButton.configuration = configSaveChangesButton
        self.leaveAppButton.layer.cornerRadius = 8
    }
    
    func setupUIButtons(){
        self.configLeaveAppButton()
        self.configSavePasswordButtonDisabled()
        self.configExcludeButton()
        
    }
}

//MARK: - customAlertDelegate
extension MoreOptionsVC: customAlertDelegate {
    func okPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
}

//MARK: - UITextFieldDelegate
extension MoreOptionsVC:UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case self.currentPasswordTextField:
            if self.currentPasswordTextField.text == ""{
                setRedBorder(textField: textField)
            }else{
                setNormalBorder(textField: textField)
            }
        case self.newPasswordTextField:
            if self.newPasswordTextField.text == ""{
                setRedBorder(textField: textField)
            }else{
                setNormalBorder(textField: textField)
            }
            
            if self.newPasswordTextField.text?.count ?? 0 < 6 {
                self.newPasswordErrorLabel.isHidden = false
                self.newPasswordErrorLabel.text = "Senha deve conter pelo menos 6 caracteres"
            } else {
                self.newPasswordErrorLabel.isHidden = true
            }
            
        case self.confirmNewPasswordTextField:
            if self.confirmNewPasswordTextField.text == ""{
                setRedBorder(textField: textField)
            }else{
                setNormalBorder(textField: textField)
            }
            
            if self.confirmNewPasswordTextField.text?.count ?? 0 < 6 {
                self.confirmPasswordErrorLabel.isHidden = false
                self.confirmPasswordErrorLabel.text = "Senha deve conter pelo menos 6 caracteres"
            } else {
                self.confirmPasswordErrorLabel.isHidden = true
            }
            
            if self.newPasswordTextField.text != self.confirmNewPasswordTextField.text {
                self.confirmPasswordErrorLabel.isHidden = false
                self.confirmPasswordErrorLabel.text = "Nova senha diferente da confirmação de senha"
            } else {
                self.confirmPasswordErrorLabel.isHidden = true
            }
            
        default:
            break
        }
        
        guard let currentPassword = self.currentPasswordTextField.text else {return}
        guard let newPassword = self.newPasswordTextField.text else {return}
        guard let confirmNewPassword = self.confirmNewPasswordTextField.text else {return}
        
        if currentPassword != "" &&
            newPassword != "" &&
            confirmNewPassword != "" {
            if newPassword.count >= 6 && confirmNewPassword.count >= 6 {
                if newPassword == confirmNewPassword {
                    self.configSavePasswordButtonEnabled()
                }
            }
        } else {
            self.configSavePasswordButtonDisabled()
        }
    }
    
    func setRedBorder(textField: UITextField){
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1.0
    }
    
    func setNormalBorder(textField: UITextField){
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: Navigation Bar Customization
extension MoreOptionsVC {
    func setupNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Mais Opções"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: CommonConstants.montserratRegularFont.rawValue, size: 24) ?? UIFont()]
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4784313725, green: 0.4784313725, blue: 0.4784313725, alpha: 1)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: CommonConstants.backArrowImage.rawValue),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
    }
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
}

