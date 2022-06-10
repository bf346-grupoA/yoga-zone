//
//  ResetPasswordViewControllerX.swift
//  YogaZone
//
//  Created by Marcelo Silva on 04/06/22.
//

import UIKit
import FirebaseAuth

class ResetPasswordViewController: UIViewController, UIGestureRecognizerDelegate {

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
        self.setupNavigationBar()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false        
    }
    
}

extension ResetPasswordViewController: ResetPassowrdViewProtocol {
    
    func tappedBackButtonAction() {
       
    }
    
    func forgotPassword() {
        guard let resetPassword = resetPassword else {return}
        
        auth?.sendPasswordReset(withEmail: resetPassword.getEmail(), completion: { error in
            
            if error != nil{
                self.alert?.setup(title: LoginConstants.ops.rawValue, message: LoginConstants.somethingWrong.rawValue, okText: LoginConstants.ok.rawValue)
                return
            }
            
            self.resetPassword?.sendButton.startAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                self.resetPassword?.sendButton.stopAnimation(animationStyle: .normal, revertAfterDelay: 0) {
                    self.alert?.setup(title: LoginConstants.sucess.rawValue, message: LoginConstants.sentEmail.rawValue, okText: LoginConstants.ok.rawValue)
                }
            }
        })
    }
    
}

//MARK: - UITextFieldDelegate

extension ResetPasswordViewController: UITextFieldDelegate {
    
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
    

extension ResetPasswordViewController {
    
    func setupNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 24) ?? UIFont()]
        
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


