//
//  CancelContainerViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 15/03/22.
//

import UIKit

class CancelContainerViewController:UIViewController {
    
    @IBOutlet weak var cancelButton: UIButton!
    
    let alertService = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        let alertVC = alertService.alert(parentVC: self, alertTitle: "Atenção!", alertDescription: "Confirmar Saída do Evento?", cancelText: "Não", confirmText: "Sim", actionType: "Cancelamento")
        self.present(alertVC, animated: true)
    }
    
}

// MARK: UI Functions
extension CancelContainerViewController {
    func setupUI(){
        self.cancelButton.configuration = nil
        self.cancelButton.setTitle("Cancelar Participação", for: .normal)
        self.cancelButton.setTitleColor(.white, for: .normal)
        self.cancelButton.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.cancelButton.backgroundColor = #colorLiteral(red: 0.831372549, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        self.cancelButton.layer.cornerRadius = 8
        
    }
    
}

