//
//  EventFilterViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 05/03/22.
//

import UIKit

class EventFilterViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var finalizedLabel: UILabel!
    @IBOutlet weak var finalizedSwitch: UISwitch!
    @IBOutlet weak var createdByMeLabel: UILabel!
    @IBOutlet weak var createdByMeSwitch: UISwitch!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var clearFiltersButtons: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

// MARK: UI Functions
extension EventFilterViewController {
    func setupUI(){
        cancelButton.setTitle("Cancelar", for: .normal)
        cityLabel.text = "Cidade"
        cityTextField.placeholder = "Cidade"
        startDateLabel.text = "Data inicial"
        startDateTextField.placeholder = "Inicio"
        endDateLabel.text = "Data final"
        endDateTextField.placeholder = "Fim"
        eventNameLabel.text = "Nome do Evento"
        eventNameTextField.placeholder = "Nome do Evento"
        finalizedLabel.text = "Finalizados"
        createdByMeLabel.text = "Criados por mim"
        applyButton.setTitle("Aplicar", for: .normal)
        clearFiltersButtons.setTitle("Limpar filtros", for: .normal)
        
    }
    
}
