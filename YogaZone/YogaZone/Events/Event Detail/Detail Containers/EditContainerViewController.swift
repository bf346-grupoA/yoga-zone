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
        
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let vc = EditEventDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: UI Functions
extension EditContainerViewController {
    func setupUI(){
        self.editButton.configuration = nil
        self.editButton.setTitle("Editar Evento", for: .normal)
        self.editButton.setTitleColor(.white, for: .normal)
        self.editButton.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.editButton.backgroundColor = #colorLiteral(red: 0.8588235294, green: 0.5137254902, blue: 0.2823529412, alpha: 1)
        self.editButton.layer.cornerRadius = 8
        
    }
    
}
