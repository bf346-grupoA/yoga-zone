//
//  ConfirmContainerViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 15/03/22.
//

import UIKit

class ConfirmContainerViewController:UIViewController {
    
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.confirmButton.setTitle("Confirmar Participação", for: .normal)
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        
    }
    
}
