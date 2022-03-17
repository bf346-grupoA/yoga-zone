//
//  telaaLoginViewController.swift
//  YogaZone
//
//  Created by Marcelo Silva on 16/03/22.
//

import UIKit

class telaaLoginViewController: UIViewController {
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldSenha: UITextField!
    @IBOutlet weak var buttonForgotPassowrd: UIButton!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var labelOr: UILabel!
    @IBOutlet weak var buttonGoogle: UIButton!
    @IBOutlet weak var buttonFb: UIButton!
    @IBOutlet weak var buttonJoin: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonLogin.layer.cornerRadius = 10
        self.buttonGoogle.layer.cornerRadius = 10
        self.buttonFb.layer.cornerRadius = 10
        self.textFieldEmail.layer.cornerRadius = 10
        self.textFieldSenha.layer.cornerRadius = 10
        self.textFieldSenha.isHidden = true
        

    }

    @IBAction func tappedLogin(_ sender: Any) {
    }
    @IBAction func tappedGoogle(_ sender: Any) {
    }
    
    @IBAction func tappedFb(_ sender: Any) {
    }
    
    @IBAction func tappedJoin(_ sender: Any) {
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
