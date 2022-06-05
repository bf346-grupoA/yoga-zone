//
//  LoginView.swift
//  YogaZone
//
//  Created by Marcelo Silva on 04/06/22.
//

import UIKit
import TransitionButton

protocol LoginViewProtocol: AnyObject {
    func joinButtonAction()
    func subscribeButtonAction()
    func forgotPasswordButtonAction()
}

class LoginView: UIView {
    
    weak private var delegate: LoginViewProtocol?
    
    func delegate(delegate: LoginViewProtocol?) {
        self.delegate = delegate
    }
    
    
    lazy var appImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: Constants.logoApp.rawValue)
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
        textField.placeholder = Constants.emailPlaceholder.rawValue
        textField.textColor = .darkGray
        return textField
    }()
    
//    lazy var eyeImageView:UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage(named: "eye")
//        image.contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "eyeSlash")!.size.width height:UIImage)
//        image.contentMode = .scaleAspectFit
//        return image
//    }()
    
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
        textField.placeholder = Constants.passwordPlaceholder.rawValue
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.forgotPassword.rawValue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 83/255, green: 66/255, blue: 114/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(self.tappedForgotPasswordButton), for: .touchUpInside)
        return button
    }()
    
    lazy var joinButton: TransitionButton = {
        let button = TransitionButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 83/255, green: 66/255, blue: 114/255, alpha: 1.0)
        button.layer.cornerRadius = 7
        button.clipsToBounds = true
        button.setTitle(Constants.enter.rawValue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(self.tappedJoinInButton), for: .touchUpInside)
        button.spinnerColor = .white
        return button
    }()
    
    lazy var subscribeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 228/255, green: 228/255, blue: 236/255, alpha: 1.0)
        button.setTitle(Constants.noAccount.rawValue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 7
        button.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(self.tappedSubscribeButton), for: .touchUpInside)
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

        self.addSubview(self.appImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.forgotPasswordButton)
        self.addSubview(self.joinButton)
        self.addSubview(self.subscribeButton)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    public func getEmail()->String {
        return emailTextField.text ?? Constants.empty.rawValue
    }
    
    public func getPassword()->String {
        return passwordTextField.text ?? Constants.empty.rawValue
    }
    
    
    public func validateTextField() {
        if emailTextField.text != Constants.empty.rawValue && passwordTextField.text != Constants.empty.rawValue {
            self.enableButton(true)
        } else {
            self.enableButton(false)
        }
    }
    
    private func enableButton(_ enable: Bool) {
        if enable {
            self.joinButton.isEnabled = true
            self.joinButton.setTitleColor(.white, for: .normal)
        } else {
            self.joinButton.isEnabled = false
            self.joinButton.setTitleColor(.lightGray, for: .normal)
        }
    }
    
    @objc private func tappedJoinInButton() {
        self.delegate?.joinButtonAction()
    }
    
    @objc private func tappedSubscribeButton() {
        self.delegate?.subscribeButtonAction()
    }
    
    @objc private func tappedForgotPasswordButton() {
        self.delegate?.forgotPasswordButtonAction()
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            
            
            self.appImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            self.appImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.appImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            self.appImageView.heightAnchor.constraint(equalToConstant: 80),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.appImageView.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.forgotPasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.joinButton.topAnchor.constraint(equalTo: self.forgotPasswordButton.bottomAnchor, constant: 20),
            self.joinButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.joinButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.joinButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            self.subscribeButton.topAnchor.constraint(equalTo: self.joinButton.bottomAnchor, constant: 10),
            self.subscribeButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.subscribeButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.subscribeButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
        ])
    }
}
