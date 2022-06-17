//
//  RegisterView.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 04/06/22.
//

import UIKit

enum FormFieldDimension: CGFloat {
    case defaultSize = 50
}

class RegisterView: UIView {
    
    // MARK: Parameters
    weak var delegate: FormInputDelegate?
    
    // MARK: UI Elements
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Comfortaa-SemiBold", size: 16)
        label.text = "Vamos iniciar uma incrível jornada juntos 😃"
        label.sizeToFit()
        label.numberOfLines = 0
        
        return label
    }()
  
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.backgroundColor = #colorLiteral(red: 0.9718734622, green: 0.9751194119, blue: 0.9782194495, alpha: 1)
        textField.autocorrectionType = .no
        textField.textColor = .darkGray
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.font = UIFont(name: "Comfortaa-Bold", size: 16)
        textField.placeholder = "Email"
        textField.backgroundColor = .white
        
        return textField
    }()
    
    private lazy var preferredNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.backgroundColor = #colorLiteral(red: 0.9718734622, green: 0.9751194119, blue: 0.9782194495, alpha: 1)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textColor = .darkGray
        textField.font = UIFont(name: "Comfortaa-Bold", size: 16)
        textField.placeholder = "Seu nome ou nick favorito"
        
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.backgroundColor = #colorLiteral(red: 0.9718734622, green: 0.9751194119, blue: 0.9782194495, alpha: 1)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textColor = .darkGray
        textField.font = UIFont(name: "Comfortaa-Bold", size: 16)
        textField.placeholder = "Senha"
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = #colorLiteral(red: 0.9718734622, green: 0.9751194119, blue: 0.9782194495, alpha: 1)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.borderStyle = .roundedRect
        textField.textColor = .darkGray
        textField.font = UIFont(name: "Comfortaa-Bold", size: 16)
        textField.placeholder = "Confirme sua senha"
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar Conta", for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 16)
        button.setTitleColor(.yogaWhite, for: .normal)
        button.backgroundColor = .yogaLighterPurple
        button.layer.opacity = 0.5
        button.isEnabled = false
        button.isOpaque = true
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        button.layer.cornerRadius = 7
        
        return button
    }()
    
    // MARK: Lifecycle
    init(delegate: RegisterViewController) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.delegate = delegate
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func clearForm() {
        self.emailTextField.text = ""
        self.preferredNameTextField.text = ""
        self.passwordTextField.text = ""
        self.confirmPasswordTextField.text = ""
    }

}


// MARK: View Setup & Constraints
extension RegisterView {

    private func setupView() {
        setupTextFieldDelegates()
        setFormInitialState()
        
        addSubview(welcomeLabel)
        addSubview(emailTextField)
        addSubview(preferredNameTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(registerButton)
        
        clearForm()
        setupConstraints()
    }
    
    private func setupTextFieldDelegates() {
        self.emailTextField.delegate = self
        self.preferredNameTextField.delegate = self
        self.passwordTextField.delegate = self
        self.confirmPasswordTextField.delegate = self
    }

    private func setupConstraints() {
        setupWelcomeConstraints()
        setupEmailConstraints()
        setupNameOrNickConstraints()
        setupPasswordConstraints()
        setupConfirmPasswordConstraints()
        setupRegisterButtonConstraints()
    }

    private func setupWelcomeConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupEmailConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            emailTextField.heightAnchor.constraint(equalToConstant: FormFieldDimension.defaultSize.rawValue)
        ])
    }
    
    private func setupNameOrNickConstraints() {
        NSLayoutConstraint.activate([
            preferredNameTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            preferredNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            preferredNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            preferredNameTextField.heightAnchor.constraint(equalToConstant: FormFieldDimension.defaultSize.rawValue)
        ])
    }
    
    private func setupPasswordConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: preferredNameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            passwordTextField.heightAnchor.constraint(equalToConstant: FormFieldDimension.defaultSize.rawValue)
        ])
    }
    
    private func setupConfirmPasswordConstraints() {
        NSLayoutConstraint.activate([
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: FormFieldDimension.defaultSize.rawValue)
        ])
    }
    
    private func setupRegisterButtonConstraints() {
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            registerButton.heightAnchor.constraint(equalToConstant: FormFieldDimension.defaultSize.rawValue)
        ])
    }
    
}

// MARK: TextField Delegates & Validations
extension RegisterView: UITextFieldDelegate, FormDataDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setFocus(textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        validateField(textField)
    }
    
    private func validateField(_ textField: UITextField) {
        
        if (textField.text == "" && textField != self.preferredNameTextField) {
            notifyError(textField)
            isFormFilled()
            
        } else {
            unsetFocus(textField)
            isFormFilled()
           
            if(textField == self.emailTextField) {
               validateEmailField(textField)
            }
               
            if(textField == self.passwordTextField || textField == self.confirmPasswordTextField) {
                validatePassword(textField)
            }
        }
    }
    
    private func validatePassword(_ selectedElement: UITextField) {
        
        if(!isValidPasswordField()) {
            if(selectedElement != self.passwordTextField) { notifyError(self.passwordTextField) }
            notifyError(self.confirmPasswordTextField)
        } else {
            unsetFocus(self.passwordTextField)
            unsetFocus(self.confirmPasswordTextField)
        }
        
    }
    
    private func validateEmailField(_ selectedElement: UITextField) {
        guard let email = selectedElement.text else { return }
        
        if(!email.isValid(inputType: .email)) {
            notifyError(self.emailTextField)
        } else {
            unsetFocus(self.emailTextField)
        }
        
    }
    
    private func isFormFilled() {
        
        guard let email = self.emailTextField.text,
              let password = self.passwordTextField.text,
              let confirmPassword = self.confirmPasswordTextField.text else {
            
            enableButton(false)
            return
        }
        
        let passwordMatches = matches(password: password, confirmationPassword: confirmPassword)
        
        let formatIsValid = (
            email.isValid(inputType: .email) &&
            password.isValid(inputType: .password) &&
            confirmPassword.isValid(inputType: .password)
        )
        
        enableButton(passwordMatches && formatIsValid)
    }
    
    private func isValidPasswordField() -> Bool {
        if (self.passwordTextField.text != "" && self.confirmPasswordTextField.text != "") {
            return self.passwordTextField.text == self.confirmPasswordTextField.text
        }
        
        return false
    }
    
    private func matches(password: String, confirmationPassword: String) -> Bool {
        return confirmationPassword.elementsEqual(password)
    }
    
    private func notifyError(_ selectedElement: UITextField) {
        selectedElement.layer.borderColor = UIColor.systemRed.cgColor
        selectedElement.layer.borderWidth = 2.0
        selectedElement.layer.cornerRadius = 4
    }
    
    private func unsetFocus(_ selectedElement: UITextField) {
        selectedElement.layer.borderColor = UIColor.systemGray.cgColor
        selectedElement.layer.borderWidth = 0.5
        selectedElement.layer.cornerRadius = 4
    }
    
    private func setFocus(_ selectedElement: UITextField) {
        selectedElement.layer.borderColor = UIColor.systemBlue.cgColor
        selectedElement.layer.borderWidth = 1.0
        selectedElement.layer.cornerRadius = 4
    }
    
    private func enableButton(_ isEnabled: Bool) {
        self.registerButton.layer.opacity = isEnabled ? 1.0 : 0.5
        self.registerButton.isEnabled = isEnabled
        
        if self.registerButton.isEnabled {
            setViewModelUser()
        }
    }
    
    private func setFormInitialState() {
        self.emailTextField.becomeFirstResponder()
        
        unsetFocus(self.emailTextField)
        unsetFocus(self.preferredNameTextField)
        unsetFocus(self.passwordTextField)
        unsetFocus(self.confirmPasswordTextField)
        
        self.emailTextField.text = ""
        self.preferredNameTextField.text = ""
        self.passwordTextField.text = ""
        self.confirmPasswordTextField.text = ""
        
        self.registerButton.isEnabled = false
    }

    private func setViewModelUser() {
        guard let email = self.emailTextField.text, let password = self.passwordTextField.text else { return }
        
        let formUser = UserRegistrationModel(email: email, name: self.preferredNameTextField.text ?? "", password: password)
        self.delegate?.getUser(user: formUser)
    }
}

// MARK: Button Action
extension RegisterView {
    
    @objc private func tappedRegisterButton(_ sender: UIButton!) {
        self.delegate?.submit()
    }
    
}
