//
//  novaSenhaViewController.swift
//  YogaZone
//
//  Created by Marcelo Silva on 16/03/22.
//

import UIKit

class novaSenhaViewController: UIViewController {


    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var infPassword: UILabel!
    @IBOutlet weak var textFieldConfirmPass: UITextField!
    @IBOutlet weak var InfConfirmPassword: UILabel!
    @IBOutlet weak var buttonCreatNewPassword: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textFieldPassword.placeholder = "Digite sua nova senha"
        self.textFieldConfirmPass.placeholder = "Confirme sua nova senha"
        self.textFieldPassword.layer.cornerRadius = 10
        self.textFieldConfirmPass.layer.cornerRadius = 10
        self.infPassword.textColor = .red
        self.InfConfirmPassword.textColor = .red
        self.buttonCreatNewPassword.layer.cornerRadius = 10
        self.textFieldPassword.isSecureTextEntry = true
        self.textFieldConfirmPass.isSecureTextEntry = true
        self.textFieldPassword.layer.borderColor = UIColor.lightGray.cgColor
        self.textFieldConfirmPass.layer.borderColor = UIColor.lightGray.cgColor
//signing contracts
        self.textFieldPassword.delegate = self
        self.textFieldConfirmPass.delegate = self
    //ididid
    }

    @IBAction func tappedCreatedNewPassword(_ sender: Any) {
        let _: Void = show(InfEmailViewController(), sender:UIViewController().self)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension novaSenhaViewController:UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        if textField == self.textFieldPassword{
            if
                self.textFieldPassword.text == ""{
                textField.layer.borderColor = UIColor.red.cgColor
            }else if
                self.textFieldConfirmPass.text != self.textFieldPassword.text {
                self.textFieldPassword.layer.borderColor = UIColor.red.cgColor
                self.textFieldConfirmPass.layer.borderColor = UIColor.red.cgColor
            }else{
                self.textFieldPassword.layer.borderColor = UIColor.lightGray.cgColor
                self.textFieldConfirmPass.layer.borderColor = UIColor.lightGray.cgColor
            }
        }
        
        
        if textField == self.textFieldConfirmPass{
            if
                self.textFieldConfirmPass.text == ""{
                textField.layer.borderColor = UIColor.red.cgColor
            }else if
                self.textFieldConfirmPass.text != self.textFieldPassword.text {
                self.textFieldPassword.layer.borderColor = UIColor.red.cgColor
                self.textFieldConfirmPass.layer.borderColor = UIColor.red.cgColor
            } else {
                self.textFieldPassword.layer.borderColor = UIColor.lightGray.cgColor
                self.textFieldConfirmPass.layer.borderColor = UIColor.lightGray.cgColor
            }
        }
}
}
