//
//  MeuPerfilVC.swift
//  YogaZone
//
//  Created by Marcus on 07/03/22.
//

import UIKit

class MyProfileVC: UIViewController, UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var perfilImage: UIImageView!
    @IBOutlet weak var tappedCameraIconImage: UIImageView!
    @IBOutlet weak var tappedMoreOptionsButtonImage: UIImageView!
    @IBOutlet weak var saveChangesButton: UIButton!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldCity: UITextField!
    @IBOutlet weak var textFieldState: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configImages()
        configMoreOptionsButton()
        configSaveChangeButton()
        setupNavigationBar()
    }
    
    func configImages(){
        tappedMoreOptionsButtonImage.image = UIImage(named: "moreOptions")
        perfilImage.image = UIImage(named: "person")
        tappedCameraIconImage.image = UIImage(named: "cameraIcon")
    }
    

    private func configMoreOptionsButton(){
        let tapMoreOptionsButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedMoreOptionsButton))
        self.tappedMoreOptionsButtonImage.addGestureRecognizer(tapMoreOptionsButton)
        self.tappedMoreOptionsButtonImage.isUserInteractionEnabled = true
    }
    
    @objc func tappedMoreOptionsButton(){
        self.navigationController?.pushViewController(MoreOptionsVC(), animated: true)
        
    }
    
    func configSaveChangeButton(){
        var containerTitle = AttributeContainer()
            containerTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        
        var configSaveChangesButton = UIButton.Configuration.filled()
            configSaveChangesButton.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
            configSaveChangesButton.baseForegroundColor = .white
            configSaveChangesButton.attributedTitle = AttributedString("Salvar Alterações", attributes: containerTitle)
        
        self.saveChangesButton.configuration = configSaveChangesButton
        self.saveChangesButton.layer.cornerRadius = 8
    }
    
    @IBAction func tappedSaveChangesButton(_ sender: UIButton) {
        CustomAlertVC.instance.showAlert(titleType: .success, message: "Suas alterações foram salvas com sucesso !", alertType: .success)
    }
}


// MARK: Navigation Bar Customization
extension MyProfileVC {
    func setupNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Meu Perfil"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 16) ?? UIFont()]
        
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


