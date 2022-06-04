//
//  LoginViewController.swift
//  YogaZone
//
//  Created by Marcelo Silva on 03/06/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginView: LoginView?
    
    override func loadView() {
        self.loginView = LoginView()
        self.view = self.loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView?.configTextFieldDelegate(delegate: self)
        self.loginView?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

//MARK: - LoginScreenProtocol

extension LoginViewController: LoginViewProtocol {
    
    func actionSignInButton() {
       let vc = UIStoryboard(name:
       "HomeStoryboard", bundle: nil).instantiateViewController (withIdentifier: "HomeViewController") as? HomeViewController
        self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    func actionSignUpButton() {
//        let vc: SignUpViewController = SignUpViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func actionforgotPasswordButton() {
//        let vc: PasswordChangeViewController = PasswordChangeViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 2.0
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        self.loginView?.validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.loginView?.emailTextField {
            self.loginView?.passwordTextField.becomeFirstResponder()
        } else if textField == self.loginView?.passwordTextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
