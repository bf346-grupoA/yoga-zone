//
//  tappedSaveResultViewController.swift
//  YogaZone
//
//  Created by Marcelo Silva on 23/03/22.
//

import UIKit

class tappedSaveResultViewController: UIViewController {

    var message:String = ""
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.messageLabel.text = self.message
        
    }
    @IBAction func tappedButtonOK(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    

   
}
