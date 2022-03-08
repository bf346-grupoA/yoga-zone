//
//  MeuPerfilVC.swift
//  YogaZone
//
//  Created by Marcus on 07/03/22.
//

import UIKit

class MeuPerfilVC: UIViewController {


    @IBOutlet weak var tappedArrowVoltarImage: UIImageView!
    
    @IBOutlet weak var meuPerfilLabel: UILabel!
    
    @IBOutlet weak var perfilImage: UIImageView!
    
    @IBOutlet weak var tappedCameraIconImage: UIImageView!
    
    //NICK
    @IBOutlet weak var nickLabel: UILabel!
    @IBOutlet weak var nickTextField: UITextField!

    
    //SENHA
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!

    
    //DATA NASC
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var birthdayTextField: UITextField!
    
    //LOCALIDADE
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationTextField: UITextField!
    
    //SEXO
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var sexTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.passwordTextField.setupRightImage(imageName: "editIcon")
        self.nickTextField.setupRightImage(imageName: "editIcon")
        self.birthdayTextField.setupRightImage(imageName: "editIcon")
        self.locationTextField.setupRightImage(imageName: "editIcon")
        self.sexTextField.setupRightImage(imageName: "editIcon")
        
        tappedArrowVoltarImage.image = UIImage(named: "arrowVoltarCinza")
        perfilImage.image = UIImage(named: "person")
        tappedCameraIconImage.image = UIImage(named: "cameraIcon")
    }
}

extension UITextField {
    func setupRightImage(imageName:String){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
        imageContainerView.addSubview(imageView)
        rightView = imageContainerView
        rightViewMode = .always
    }
}
