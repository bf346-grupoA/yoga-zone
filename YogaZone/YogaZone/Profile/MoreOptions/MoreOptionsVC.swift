//
//  AlterarSenhaVC.swift
//  YogaZone
//
//  Created by Marcus on 09/03/22.
//

import UIKit

class MoreOptionsVC: UIViewController {

    @IBOutlet weak var changePasswordTitleLabel: UILabel!
    
    @IBOutlet weak var tappedArrowBackToProfileImage: UIImageView!
    
    @IBOutlet weak var CurrentPasswordTextField: UITextField!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configImage()
        configBackButton()
    }
    
    func configImage(){
        tappedArrowBackToProfileImage.image = UIImage(named: "arrowVoltarCinza")
        
        // Hide Back Button from UINavigationItem
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func configBackButton(){
        let tapBackButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedBackButton))
        self.tappedArrowBackToProfileImage.addGestureRecognizer(tapBackButton)
        self.tappedArrowBackToProfileImage.isUserInteractionEnabled = true
        
    }
    
    @objc func tappedBackButton(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func tappedForgotPasswordButton(_ sender: UIButton) {
        //IR PARA TELHA DE ESQUECI MINHA SENHA
    }
    
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        //MOSTRAR CONFIRMACAO DE NOVA SENHA SETADA
    }
    
    @IBAction func tappedDeleteAccountButton(_ sender: UIButton) {
        //MOSTRAR MODAL DE CONFIRMAR EXCLUIR CONTA
    }
    
    @IBAction func leaveAppButton(_ sender: UIButton) {
        //MOSTRAR MODAL DE CONFIRMAR SAIR DO APP
    }
    
}
