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
        self.cancelButton.setTitle("Cancelar Participação", for: .normal)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        let alertVC = alertService.alert(alertTitle: "Atenção!", alertDescription: "Confirmar Saída do Evento?", cancelText: "Não", confirmText: "Sim", actionType: "Cancelamento")
        present(alertVC, animated: true)
    }
    
}

