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
        titleLabel.text = "Criar Novo Evento"
        eventNameTextField.placeholder = "Nome do evento"
        eventDateTextField.placeholder = "Data do evento"
        eventStartTimeTextField.placeholder = "Horário de início"
        eventNumberOfParticipantsTextField.placeholder = "Número de participantes"
        eventLocalTextField.placeholder = "Local"
        eventDescriptionTextField.placeholder = "Descrição de outras informações"
        createEventButton.setTitle("Criar Evento", for: .normal)
    }
    
}
