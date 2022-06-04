//
//  LoginView.swift
//  YogaZone
//
//  Created by Marcelo Silva on 04/06/22.
//

import UIKit
import TransitionButton

protocol LoginViewProtocol: AnyObject {
    func actionSignInButton()
    func actionSignUpButton()
    func actionforgotPasswordButton()
}

class LoginView: UIView {
    
    weak private var delegate: LoginViewProtocol?
    
    func delegate(delegate: LoginViewProtocol?) {
        self.delegate = delegate
    }
    
    
    lazy var logoAppImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Logo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 7
        textField.layer.borderColor = CGColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
        textField.layer.borderWidth = 1.0
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.placeholder = "E-mail"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 7
        textField.layer.borderColor = CGColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
        textField.layer.borderWidth = 1.0
        textField.autocapitalizationType = .none
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.placeholder = "Senha"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueceu sua senha?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 83/255, green: 66/255, blue: 114/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(self.didTapforgotPasswordButton), for: .touchUpInside)
        return button
    }()
    
    lazy var signInButton: TransitionButton = {
        let button = TransitionButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 83/255, green: 66/255, blue: 114/255, alpha: 1.0)
        button.layer.cornerRadius = 7
        button.clipsToBounds = true
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(self.didTapSignInButton), for: .touchUpInside)
        button.spinnerColor = .white
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 228/255, green: 228/255, blue: 236/255, alpha: 1.0)
        button.setTitle("Ainda sem Conta? Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 7
        button.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(self.didTapSignUpButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround()
        self.addSubView()
        self.setUpConstraints()
        self.enableButton(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackGround() {
        self.backgroundColor = .white
    }
    
    private func addSubView() {

        self.addSubview(self.logoAppImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.forgotPasswordButton)
        self.addSubview(self.signInButton)
        self.addSubview(self.signUpButton)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    public func getEmail()->String {
        return emailTextField.text ?? ""
    }
    
    public func getPassword()->String {
        return passwordTextField.text ?? ""
    }
    
    
    public func validateTextField() {
        if emailTextField.text != "" && passwordTextField.text != "" {
            self.enableButton(true)
        } else {
            self.enableButton(false)
        }
    }
    
    private func enableButton(_ enable: Bool) {
        if enable {
            self.signInButton.isEnabled = true
            self.signInButton.setTitleColor(.white, for: .normal)
        } else {
            self.signInButton.isEnabled = false
            self.signInButton.setTitleColor(.lightGray, for: .normal)
        }
    }
    
    @objc private func didTapSignInButton() {
        self.delegate?.actionSignInButton()
    }
    
    @objc private func didTapSignUpButton() {
        self.delegate?.actionSignUpButton()
    }
    
    @objc private func didTapforgotPasswordButton() {
        self.delegate?.actionforgotPasswordButton()
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            
            
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 80),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.forgotPasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.signInButton.topAnchor.constraint(equalTo: self.forgotPasswordButton.bottomAnchor, constant: 20),
            self.signInButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.signInButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.signInButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            self.signUpButton.topAnchor.constraint(equalTo: self.signInButton.bottomAnchor, constant: 10),
            self.signUpButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.signUpButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.signUpButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
        ])
    }
}
