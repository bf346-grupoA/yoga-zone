//
//  EmailAndPasswordCell.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import UIKit

class EmailAndPasswordCell: UITableViewCell {
    private var userData: UserData? = nil
    weak var delegate: FormDataDelegate?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDelegates()
    }

    func setupDelegates() {
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
}


extension EmailAndPasswordCell: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        if isValidForm() {
            guard let email = self.emailTextField.text else { return }
            guard let password = self.emailTextField.text else { return }
            
            self.userData = UserData(email: email, password: password)
            
            submit()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func isValidForm() -> Bool {
        return self.emailTextField.text != "" && self.passwordTextField.text != ""
    }
    
    func submit() {
        guard let user = self.userData else { return }
        
        self.delegate?.send(userData: user)
    }
    
    
}

// MARK: Static properties & methods
extension EmailAndPasswordCell {
    static let identifier: String = "EmailAndPasswordCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
