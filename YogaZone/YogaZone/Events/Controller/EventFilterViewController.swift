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
    
    @IBAction func applyButtonTapped(_ sender: Any) {
    
    }
    
    @IBAction func clearFilterButtonTapped(_ sender: Any) {
    
    }
    
}

// MARK: UI Functions
extension EventFilterViewController {
    func setupUI(){
        self.cancelButton.setTitle("Cancelar", for: .normal)
        self.cityLabel.text = "Cidade"
        self.cityTextField.placeholder = "Cidade"
        self.startDateLabel.text = "Data inicial"
        self.startDateTextField.placeholder = "Inicio"
        self.endDateLabel.text = "Data final"
        self.endDateTextField.placeholder = "Fim"
        self.eventNameLabel.text = "Nome do Evento"
        self.eventNameTextField.placeholder = "Nome do Evento"
        self.finalizedLabel.text = "Finalizados"
        self.createdByMeLabel.text = "Criados por mim"
        
        self.applyButton.configuration = nil
        self.applyButton.setTitle("Aplicar", for: .normal)
        self.applyButton.setTitleColor(.white, for: .normal)
        self.applyButton.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.applyButton.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
        self.applyButton.layer.cornerRadius = 8
        
        self.clearFiltersButtons.configuration = nil
        self.clearFiltersButtons.setTitle("Limpar Filtros", for: .normal)
        self.clearFiltersButtons.setTitleColor(.white, for: .normal)
        self.clearFiltersButtons.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.clearFiltersButtons.backgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        self.clearFiltersButtons.layer.cornerRadius = 8
        
    }
    
}
