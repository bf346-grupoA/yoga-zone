//
//  EditContainerViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 15/03/22.
//

import UIKit

class EditContainerViewController:UIViewController {
    
    @IBOutlet weak var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editButton.setTitle("Editar Participação", for: .normal)
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let vc = EditEventDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

