//
//  CancelContainerViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 15/03/22.
//

import UIKit

class CancelContainerViewController:UIViewController {
    
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cancelButton.setTitle("Cancelar Participação", for: .normal)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
    }
    
}

