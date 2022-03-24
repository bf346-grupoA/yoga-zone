//
//  modalSViewController.swift
//  YogaZone
//
//  Created by Marcelo Silva on 17/03/22.
//

import UIKit

class ModalSuccessViewController: UIViewController {

    @IBOutlet weak var viewControllerMOdal: UIView!
    @IBOutlet weak var buttonLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllerMOdal.layer.cornerRadius = 8
    }

    @IBAction func tappedOkButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
