//
//  ProfileViewX.swift
//  YogaZone
//
//  Created by Marcelo Silva on 08/06/22.
//

    import UIKit

    protocol ProfileViewProtocol: AnyObject {
        func SaveActionButton()
        func ExitActionButton()
        func DeleteActionAccount()
    }

    class ProfilelView: UIView {
        
        weak private var delegate: ProfileViewProtocol?
        
        func delegate(delegate: ProfileViewProtocol?) {
            self.delegate = delegate
        }
        
        lazy var backButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
            return button
            
        }()
        
        
        lazy var myProfileLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
            label.text = "Meu Perfil"
            return label
        }()
        
        lazy var profileImageView:UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.image = UIImage(named: "person")
            image.contentMode = .scaleAspectFit
            return image
        }()
        
        lazy var pickerPictureButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
            button.setTitle("Insira sua Foto", for: UIControl.State.normal)
            button.setImage(UIImage(systemName: "camera"), for: .normal)
            return button
        }()
        
        lazy var nickLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
            label.text = "Nick"
            return label
        }()
        
        lazy var nickTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.autocorrectionType = .no
            textField.backgroundColor = .white
            textField.borderStyle = .roundedRect
            textField.layer.cornerRadius = 7
            textField.layer.borderColor = CGColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
            textField.layer.borderWidth = 1.0
            textField.keyboardType = .emailAddress
            textField.placeholder = "Digite seu email"
            textField.textColor = .darkGray
            return textField
        }()
        
        lazy var dobLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
            label.text = "Data de Nascimento"
            return label
        }()
        
        lazy var dobTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.autocorrectionType = .no
            textField.backgroundColor = .white
            textField.borderStyle = .roundedRect
            textField.layer.cornerRadius = 7
            textField.layer.borderColor = CGColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
            textField.layer.borderWidth = 1.0
            textField.keyboardType = .default
            textField.isSecureTextEntry = true
            textField.placeholder = "Digite a sua senha"
            textField.text = "123456"
            textField.textColor = .darkGray
            return textField
        }()
        
        lazy var locationLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
            label.text = "Localidade"
            return label
        }()
        
        lazy var locationTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.autocorrectionType = .no
            textField.backgroundColor = .white
            textField.borderStyle = .roundedRect
            textField.layer.cornerRadius = 7
            textField.layer.borderColor = CGColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
            textField.layer.borderWidth = 1.0
            textField.keyboardType = .default
            textField.isSecureTextEntry = true
            textField.textColor = .darkGray
            return textField
        }()
        
        lazy var sexLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
            label.text = "Sexo"
            return label
        }()
        
        lazy var sexTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.autocorrectionType = .no
            textField.backgroundColor = .white
            textField.borderStyle = .roundedRect
            textField.layer.cornerRadius = 7
            textField.layer.borderColor = CGColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
            textField.layer.borderWidth = 1.0
            textField.keyboardType = .default
            textField.isSecureTextEntry = true
            textField.placeholder = "Digite a sua senha"
            textField.text = "123456"
            textField.textColor = .darkGray
            return textField
        }()
        
        lazy var saveButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Esqueceu a senha?", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            button.setTitleColor(UIColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0), for: .normal)
            button.addTarget(self, action: #selector(self.savetappedButton), for: .touchUpInside)
            return button
        }()
        
        lazy var exitButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
            button.layer.cornerRadius = 7
            button.clipsToBounds = true
            button.setTitle("Entrar", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(self.exitTappedButton), for: .touchUpInside)
            return button
        }()
        
        @objc lazy var deleteAccountButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Não tem conta? Cadastre-se", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            button.setTitleColor(UIColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0), for: .normal)
            button.addTarget(self, action: #selector(setter: self.deleteAccountButton), for: .touchUpInside)
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
            self.addSubview(self.myProfileLabel)
            self.addSubview(self.profileImageView)
            self.addSubview(self.pickerPictureButton)
            self.addSubview(self.nickLabel)
            self.addSubview(self.nickTextField)
            self.addSubview(self.dobLabel)
            self.addSubview(self.dobTextField)
            self.addSubview(self.locationLabel)
            self.addSubview(self.locationTextField)
            self.addSubview(self.sexLabel)
            self.addSubview(self.sexTextField)
            self.addSubview(self.saveButton)
            self.addSubview(self.exitButton)
            self.addSubview(self.deleteAccountButton)
        }
        
        public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
            self.nickTextField.delegate = delegate
            self.dobTextField.delegate = delegate
            self.locationTextField.delegate = delegate
            self.sexTextField.delegate = delegate
        }
        
        public func validateTextField() {
            if nickTextField.text != "" && dobTextField.text != "" && locationTextField.text != "" && sexTextField.text != ""{
                self.enableButton(true)
            } else {
                self.enableButton(false)
            }
        }
        
        private func enableButton(_ enable: Bool) {
            if enable {
                self.saveButton.isEnabled = true
                self.saveButton.setTitleColor(.white, for: .normal)
            } else {
                self.saveButton.isEnabled = false
                self.saveButton.setTitleColor(.lightGray, for: .normal)
            }
        }
        
        @objc private func savetappedButton() {
            self.delegate?.SaveActionButton()
        }
        
        @objc private func exitTappedButton() {
            self.delegate?.ExitActionButton()
        }
        
        @objc private func deleteTappedButton() {
            self.delegate?.DeleteActionAccount()
        }
        
        private func setUpConstraints() {
            
            NSLayoutConstraint.activate([
                
                self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
                self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                
                self.myProfileLabel.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 20),
                self.myProfileLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
                self.myProfileLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
                
                self.profileImageView.topAnchor.constraint(equalTo: self.myProfileLabel.bottomAnchor, constant: 40),
                self.profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                self.profileImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                self.profileImageView.heightAnchor.constraint(equalToConstant: 30),
                
                self.pickerPictureButton.topAnchor.constraint(equalTo: self.profileImageView.bottomAnchor, constant: 20),
                self.pickerPictureButton.leadingAnchor.constraint(equalTo: self.myProfileLabel.leadingAnchor),
                self.pickerPictureButton.trailingAnchor.constraint(equalTo: self.myProfileLabel.trailingAnchor),
                
                self.nickLabel.topAnchor.constraint(equalTo: self.pickerPictureButton.bottomAnchor, constant: 20),
                self.nickLabel.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
                
                self.nickTextField.topAnchor.constraint(equalTo: self.nickLabel.bottomAnchor, constant: 5),
                self.nickTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                self.nickTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                
                self.dobLabel.topAnchor.constraint(equalTo: self.nickTextField.bottomAnchor, constant: 10),
                self.dobLabel.leadingAnchor.constraint(equalTo: self.nickLabel.leadingAnchor),
                self.dobLabel.trailingAnchor.constraint(equalTo: self.nickLabel.trailingAnchor),
                
                self.dobTextField.topAnchor.constraint(equalTo: self.nickTextField.bottomAnchor, constant: 5),
                self.dobTextField.leadingAnchor.constraint(equalTo: self.nickTextField.leadingAnchor),
                self.dobTextField.trailingAnchor.constraint(equalTo: self.nickTextField.trailingAnchor),
               
                self.locationLabel.topAnchor.constraint(equalTo: self.dobTextField.bottomAnchor, constant: 10),
                self.locationLabel.leadingAnchor.constraint(equalTo: self.nickLabel.leadingAnchor),
                self.locationLabel.trailingAnchor.constraint(equalTo: self.nickLabel.trailingAnchor),
               
                
                self.locationTextField.topAnchor.constraint(equalTo: self.locationLabel.bottomAnchor, constant: 10),
                self.locationTextField.leadingAnchor.constraint(equalTo: self.nickTextField.leadingAnchor),
                self.locationTextField.trailingAnchor.constraint(equalTo: self.nickTextField.trailingAnchor),
                
                self.sexLabel.topAnchor.constraint(equalTo: self.locationTextField.bottomAnchor, constant: 10),
                self.sexLabel.leadingAnchor.constraint(equalTo: self.nickLabel.leadingAnchor),
                self.sexLabel.trailingAnchor.constraint(equalTo: self.nickLabel.trailingAnchor),
               
                
                self.sexTextField.topAnchor.constraint(equalTo: self.nickTextField.bottomAnchor, constant: 5),
                self.sexTextField.leadingAnchor.constraint(equalTo: self.nickTextField.leadingAnchor),
                self.sexTextField.trailingAnchor.constraint(equalTo: self.nickTextField.trailingAnchor),
                
                self.saveButton.topAnchor.constraint(equalTo: self.sexTextField.bottomAnchor, constant: 30),
                self.saveButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
                self.saveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 40),
                self.saveButton.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 30),
                
                self.exitButton.topAnchor.constraint(equalTo: self.saveButton.bottomAnchor, constant: 15),
                self.exitButton.leadingAnchor.constraint(equalTo: self.saveButton.leadingAnchor),
                self.exitButton.trailingAnchor.constraint(equalTo: self.saveButton.trailingAnchor),
                self.exitButton.heightAnchor.constraint(equalTo: saveButton.heightAnchor),
                
                self.deleteAccountButton.topAnchor.constraint(equalTo: self.exitButton.bottomAnchor, constant: 15),
                self.deleteAccountButton.leadingAnchor.constraint(equalTo: self.saveButton.leadingAnchor),
                self.deleteAccountButton.trailingAnchor.constraint(equalTo: self.saveButton.trailingAnchor),
                self.deleteAccountButton.heightAnchor.constraint(equalTo: saveButton.heightAnchor),
                
            ])
        }
    }


