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
        setupUI()
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        let vc = EventCreatedSuccessViewController()
        vc.titleText = "Confirmado!"
        vc.sucessMessage = """
        Sua participação foi confirmada !
        Para visualiza-lo, acesse o submenu ‘Meus Eventos’ dentro de ‘Eventos’.
        """
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: UI Functions
extension ConfirmContainerViewController {
    func setupUI(){
        self.confirmButton.configuration = nil
        self.confirmButton.setTitle("Confirmar Participação", for: .normal)
        self.confirmButton.setTitleColor(.white, for: .normal)
        self.confirmButton.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.confirmButton.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.6588235294, blue: 0.3254901961, alpha: 1)
        self.confirmButton.layer.cornerRadius = 8
        
    }
    
}
