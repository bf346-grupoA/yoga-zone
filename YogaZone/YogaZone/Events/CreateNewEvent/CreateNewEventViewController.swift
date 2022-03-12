//
//  CreateNewEventController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 19/02/22.
//

import UIKit

class CreateNewEventViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var eventDateTextField: UITextField!
    @IBOutlet weak var eventStartTimeTextField: UITextField!
    @IBOutlet weak var eventNumberOfParticipantsTextField: UITextField!
    @IBOutlet weak var eventLocalTextField: UITextField!
    @IBOutlet weak var eventDescriptionTextField: UITextField!
    @IBOutlet weak var createEventButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func createEventButtonTapped(_ sender: UIButton) {
        let vc = EventCreatedSuccessViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: UI Functions
extension CreateNewEventViewController {
    func setupUI(){
        self.titleLabel.text = "Criar Novo Evento"
        self.eventNameTextField.placeholder = "Nome do evento"
        self.eventDateTextField.placeholder = "Data do evento"
        self.eventStartTimeTextField.placeholder = "Horário de início"
        self.eventNumberOfParticipantsTextField.placeholder = "Número de participantes"
        self.eventLocalTextField.placeholder = "Local"
        self.eventDescriptionTextField.placeholder = "Descrição de outras informações"
        self.createEventButton.setTitle("Criar Evento", for: .normal)
    }
    
}
