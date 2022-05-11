//
//  ResetPasswordViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var yourBestEmailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mandatoryLabel: UILabel!
    
    @IBOutlet weak var sendMailButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onTapSendMail(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
