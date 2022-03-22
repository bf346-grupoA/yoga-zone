//
//  EditEventDetailViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 15/03/22.
//

import UIKit

class EditEventDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var eventDateTextField: UITextField!
    @IBOutlet weak var eventStartTimeTextField: UITextField!
    @IBOutlet weak var eventNumberOfParticipantsTextField: UITextField!
    @IBOutlet weak var eventLocalTextField: UITextField!
    @IBOutlet weak var eventDescriptionTextField: UITextField!
    @IBOutlet weak var editEventButton: UIButton!
    @IBOutlet weak var deleteEventButton: UIButton!
    
    let alertService = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        let alertVC = alertService.alert(alertTitle: "Atenção!", alertDescription: "Confirmar Exclusão do Evento?", cancelText: "Não", confirmText: "Sim", actionType: "Exclusão")
        present(alertVC, animated: true)
    }
    
}

// MARK: UI Functions
extension EditEventDetailViewController {
    func setupUI(){
        self.titleLabel.text = "Editar Evento"
        self.eventNameTextField.placeholder = "Nome do evento"
        self.eventDateTextField.placeholder = "Data do evento"
        self.eventStartTimeTextField.placeholder = "Horário de início"
        self.eventNumberOfParticipantsTextField.placeholder = "Número de participantes"
        self.eventLocalTextField.placeholder = "Local"
        self.eventDescriptionTextField.placeholder = "Descrição de outras informações"
        self.editEventButton.setTitle("Editar Evento", for: .normal)
        self.deleteEventButton.setTitle("Excluir Evento", for: .normal)
    }
    
}
