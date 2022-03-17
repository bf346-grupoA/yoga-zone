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
        self.textFieldPassword.layer.cornerRadius = 10
        self.textFieldConfirmPass.layer.cornerRadius = 10
        self.infPassword.textColor = .red
        self.InfConfirmPassword.textColor = .red
        self.buttonCreatNewPassword.layer.cornerRadius = 10
        self.textFieldPassword.isHidden = true
        self.textFieldConfirmPass.isHidden = true

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedCreatedNewPassword(_ sender: Any) {
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
