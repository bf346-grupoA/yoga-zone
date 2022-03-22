//
//  SairDoTreinoVC.swift
//  YogaZone
//
//  Created by Marcus on 05/03/22.
//

import UIKit

class SairDoTreinoVC: UIViewController {
    
    @IBOutlet weak var WantToLeaveLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedYesButton(_ sender: UIButton) {
            // ir para home
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func tappedNoButton(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
}
