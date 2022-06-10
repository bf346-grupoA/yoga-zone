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
    
    @IBOutlet weak var CurrentPasswordTextField: UITextField!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var excludeAccountButton: UIButton!
    
    @IBOutlet weak var leaveAppButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveButton.isEnabled = true
        self.setupUIButtons()
        self.setupNavigationBar()
    }
    
    func configExcludeButton(){
        var containerTitle = AttributeContainer()
        containerTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        
        var configSaveChangesButton = UIButton.Configuration.filled()
        configSaveChangesButton.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        configSaveChangesButton.baseForegroundColor = .white
        configSaveChangesButton.attributedTitle = AttributedString("Excluir Conta", attributes: containerTitle)
        
        self.excludeAccountButton.configuration = configSaveChangesButton
        self.excludeAccountButton.layer.cornerRadius = 8
    }
    
    func configSaveButton(){
        var containerTitle = AttributeContainer()
        containerTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        
        var configSaveChangesButton = UIButton.Configuration.filled()
        configSaveChangesButton.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        configSaveChangesButton.baseForegroundColor = .white
        configSaveChangesButton.attributedTitle = AttributedString("Salvar Senha", attributes: containerTitle)
        
        self.saveButton.configuration = configSaveChangesButton
        self.saveButton.layer.cornerRadius = 8
    }
    
    func configLeaveAppButton(){
        var containerTitle = AttributeContainer()
        containerTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        
        var configSaveChangesButton = UIButton.Configuration.filled()
        configSaveChangesButton.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        configSaveChangesButton.baseForegroundColor = .white
        configSaveChangesButton.attributedTitle = AttributedString("Sair do Aplicativo", attributes: containerTitle)
        
        self.leaveAppButton.configuration = configSaveChangesButton
        self.leaveAppButton.layer.cornerRadius = 8
    }
    
    func setupUIButtons(){
        self.configLeaveAppButton()
        self.configSaveButton()
        self.configExcludeButton()
        
    }
    
    
    @IBAction func tappedSaveNewPasswordButton(_ sender: UIButton) {
        CustomAlertVC.instance.showAlert(titleType: .success, message: "Sua senha foi salva com sucesso !", alertType: .success)
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

extension MoreOptionsVC:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //REALIZAR AS VALIDACOES
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: Navigation Bar Customization
extension MoreOptionsVC {
    func setupNavigationBar(){
        self.navigationItem.title = "Mais Opções"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 16) ?? UIFont()]
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4784313725, green: 0.4784313725, blue: 0.4784313725, alpha: 1)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "arrowVoltar"),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
    }
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
}





