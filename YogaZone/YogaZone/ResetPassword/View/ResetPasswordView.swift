//
//  ResetPassowrdView.swift
//  YogaZone
//
//  Created by Marcelo Silva on 04/06/22.
//

import UIKit
import TransitionButton

protocol ResetPassowrdViewProtocol: AnyObject {
    func tappedBackButtonAction()
    func forgotPassword()
}

class ResetPasswordView: UIView {
    
    weak private var delegate: ResetPassowrdViewProtocol?
    
    func delegate(delegate: ResetPassowrdViewProtocol?) {
        self.delegate = delegate
    }    
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor(red: 83/255, green: 66/255, blue: 114/255, alpha: 1.0)
        button.setImage(UIImage(systemName: LoginConstants.backButtonImagem.rawValue), for: .normal)
        button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    lazy var ResetPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        label.text = LoginConstants.resetPassword.rawValue
        label.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 20)
        return label
    }()
    
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = #colorLiteral(red: 0.9718734622, green: 0.9751194119, blue: 0.9782194495, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 7
        textField.layer.borderColor = CGColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
        textField.layer.borderWidth = 1.0
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.font = UIFont(name: CommonConstants.comfortaaRegularFont.rawValue, size: 16)
        textField.placeholder = LoginConstants.typeEmailPlaceholder.rawValue
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = LoginConstants.obligationField.rawValue
        label.isHidden = true
        return label
    }()
    
    lazy var sendButton: TransitionButton = {
        let button = TransitionButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 114/255, green: 103/255, blue: 203/255, alpha: 1.0)
        button.cornerRadius = 7
        button.clipsToBounds = true
        button.setTitle(LoginConstants.send.rawValue, for: .normal)
        button.titleLabel?.font = UIFont(name: CommonConstants.comfortaaRegularFont.rawValue, size: 16)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.didTapSendButton), for: .touchUpInside)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround()
        self.addSubView()
        self.setUpConstraints()
        self.enableButton(false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackGround() {
        self.backgroundColor = .white
    }
    
    private func addSubView() {
        self.addSubview(self.backButton)
        self.addSubview(self.ResetPasswordLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.infoLabel)
        self.addSubview(self.sendButton)
        
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate

    }
    
    
    public func getEmail() -> String {
        return emailTextField.text ?? LoginConstants.empty.rawValue
    }
    
    public func validateTextField() {
        if emailTextField.text != LoginConstants.empty.rawValue {
            self.enableButton(true)
        } else {
            self.enableButton(false)
        }
    }
    
    private func enableButton(_ enable: Bool) {
        if enable {
            self.sendButton.isEnabled = true
            self.sendButton.setTitleColor(.white, for: .normal)
        } else {
            self.sendButton.isEnabled = false
            self.sendButton.setTitleColor(.lightGray, for: .normal)
        }
    }
    
    @objc private func tappedBackButton() {
        self.delegate?.tappedBackButtonAction()
    }
    
    @objc private func didTapSendButton() {
        self.delegate?.forgotPassword()
    }


    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.backButton.heightAnchor.constraint(equalToConstant: 30),
            self.backButton.widthAnchor.constraint(equalToConstant: 30),
            
            
            self.ResetPasswordLabel.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 20),
            self.ResetPasswordLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.ResetPasswordLabel.bottomAnchor, constant: 50),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.infoLabel.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 5),
            self.infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.sendButton.topAnchor.constraint(equalTo: self.infoLabel.bottomAnchor, constant: 25),
            self.sendButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.sendButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.sendButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
        ])
    }
}
