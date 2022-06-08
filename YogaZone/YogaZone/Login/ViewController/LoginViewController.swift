//
//  LoginViewControllerX.swift
//  YogaZone
//
//  Created by Marcelo Silva on 04/06/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var loginView: LoginView?
    var auth: Auth?
    var alert: AlertController?
    
    override func loadView() {
        self.loginView = LoginView()
        self.view = self.loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView?.configTextFieldDelegate(delegate: self)
        self.loginView?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = AlertController(controller: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true);
    }
}

extension LoginViewController: LoginViewProtocol {
    
    func joinButtonAction() {
        guard let login = loginView else {return}
        auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { user, error in
            
            if error != nil {
                self.alert?.setup(title: LoginConstants.ops.rawValue, message: LoginConstants.wrongPasswordEmail.rawValue, okText: LoginConstants.ok.rawValue)
            }else{
                if user == nil {
                    self.alert?.setup(title: LoginConstants.ops.rawValue, message: LoginConstants.somethingWrong.rawValue, okText: LoginConstants.ok.rawValue)
                }else{
                    self.loginView?.joinButton.startAnimation()
                    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                        self.loginView?.joinButton.stopAnimation(animationStyle:.normal, revertAfterDelay: 0) {
                            
                            let isOnboardingAvaliable = self.getUserDefaults(key: "isOnboardingAvaliable") as? Bool
                            if isOnboardingAvaliable != true {
                                self.navigationController?.pushViewController(UserLevelVC(), animated: true)
                            } else {
                                let vc = HomeViewController()
                                self.navigationController?.pushViewController(vc, animated: true)
                            }
                            
                        }
                    }
                    
                }
            }
        })
    }
    
    func subscribeButtonAction() {
        //TODO: nao estou conseguindo fazer a chamada para o fluxo de Register
    }
    
    func forgotPasswordButtonAction() {
        let vc = ResetPasswordViewControllerX()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

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

//MARK: - User Defaults
extension LoginViewController {
    
    func saveUserDefault(value: Any, key: String){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func getUserDefaults(key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
}
