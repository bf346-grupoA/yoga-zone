//
//  AlterarSenhaVC.swift
//  YogaZone
//
//  Created by Marcus on 09/03/22.
//

import UIKit

class AlterarSenhaVC: UIViewController {

    @IBOutlet weak var changePasswordTitleLabel: UILabel!
    
    @IBOutlet weak var closeModalImage: UIImageView!
    
    @IBOutlet weak var CurrentPasswordTextField: UITextField!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeModalImage.image = UIImage(named: "closeIcon")
    }
    
    @IBAction func tappedForgotPasswordButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedSaveButton(_ sender: UIButton) {
    }
    
}
