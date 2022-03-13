//
//  AlterarSenhaVC.swift
//  YogaZone
//
//  Created by Marcus on 09/03/22.
//

import UIKit

class MoreOptionsVC: UIViewController {

    @IBOutlet weak var changePasswordTitleLabel: UILabel!
    
    @IBOutlet weak var tappedArrowBackToProfileImage: UIImageView!
    
    @IBOutlet weak var CurrentPasswordTextField: UITextField!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.saveButton.isEnabled = true
        
        configImage()
        configBackButton()
    }
    
    func configImage(){
        tappedArrowBackToProfileImage.image = UIImage(named: "arrowVoltarCinza")
        
        // Hide Back Button from UINavigationItem
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func configBackButton(){
        let tapBackButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedBackButton))
        self.tappedArrowBackToProfileImage.addGestureRecognizer(tapBackButton)
        self.tappedArrowBackToProfileImage.isUserInteractionEnabled = true
        
    }
    
    @objc func tappedBackButton(){
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func tappedSaveNewPasswordButton(_ sender: UIButton) {
        CustomAlertVC.instance.showAlert(titleType: .success, message: "Sua senha foi salva com sucesso !", alertType: .success)
    }
    
    
    @IBAction func tappedForgotPasswordButton(_ sender: UIButton) {
        //IR PARA TELA DE ESQUECI MINHA SENHA
    }
    
    
    @IBAction func tappedDeleteAccountButton(_ sender: UIButton) {
        let vcDeleteAccount = DeleteAccountVC()
        if let sheet = vcDeleteAccount.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        self.present(vcDeleteAccount, animated: true, completion: nil)
    }
    
    @IBAction func leaveAppButton(_ sender: UIButton) {
        //MOSTRAR MODAL DE CONFIRMAR SAIR DO APP
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






