//
//  ResetPasswordViewControllerX.swift
//  YogaZone
//
//  Created by Marcelo Silva on 04/06/22.
//

import UIKit
import FirebaseAuth

class ResetPasswordViewControllerX: UIViewController {

    var resetPassword: ResetPasswordView?
    var auth: Auth?
    var alert: AlertController?
    
    override func loadView() {
        self.resetPassword = ResetPasswordView()
        self.view = self.resetPassword
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resetPassword?.configTextFieldDelegate(delegate: self)
        self.resetPassword?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = AlertController(controller: self)
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
}

//MARK: - LoginScreenProtocol

extension ResetPasswordViewControllerX: ResetPassowrdViewProtocol {
    func tappedBackButtonAction() {
        let vc = LoginViewControllerX()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func forgotPassword() {
        guard let resetPassword = resetPassword else {return}
        auth?.sendPasswordReset(withEmail: resetPassword.getEmail(), completion: { error in
            if let error = error {
                self.alert?.setup(title: "Ops", message: error.localizedDescription, okText: "Ok")
            }
            self.alert?.setup(title: "Sucesso", message: "E-mail enviado com sucesso, verifique sua caixa de e-mail/spam!", okText: "Ok")
        })
    }
    
}

//MARK: - UITextFieldDelegate

extension ResetPasswordViewControllerX: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 2.0
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        self.resetPassword?.validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.resetPassword?.emailTextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    }
    

 
