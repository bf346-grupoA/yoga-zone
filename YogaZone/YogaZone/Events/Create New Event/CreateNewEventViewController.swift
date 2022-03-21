//
//  CreateNewEventController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 19/02/22.
//

import UIKit
import SwiftUI

class CreateNewEventViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var eventDateTextField: UITextField!
    @IBOutlet weak var eventStartTimeTextField: UITextField!
    @IBOutlet weak var eventNumberOfParticipantsTextField: UITextField!
    @IBOutlet weak var eventLocalTextField: UITextField!
    @IBOutlet weak var eventDescriptionTextField: UITextField!
    @IBOutlet weak var createEventButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
    }
    
    @IBAction func createEventButtonTapped(_ sender: UIButton) {
        let vc = EventCreatedSuccessViewController()
        vc.titleText = "Criar Novo Evento"
        vc.sucessMessage = """
        Evento criado com sucesso !
        Para visualiza-lo, acesse o submenu ‘Meus Eventos’ dentro de ‘Eventos’ e selecione o filtro para visualizar os eventos ‘Criados por mim’.
        """
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: UI Functions
extension CreateNewEventViewController {
    
    func setupNavigationBar(){
        self.navigationItem.title = "Criar Novo Evento"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 24) ?? UIFont() ]
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4784313725, green: 0.4784313725, blue: 0.4784313725, alpha: 1)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "arrowVoltar"),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
    }
    
    func setupUI(){
        self.eventNameTextField.placeholder = "Nome do evento"
        self.eventDateTextField.placeholder = "Data do evento"
        self.eventStartTimeTextField.placeholder = "Horário de início"
        self.eventNumberOfParticipantsTextField.placeholder = "Número de participantes"
        self.eventLocalTextField.placeholder = "Local"
        self.eventDescriptionTextField.placeholder = "Descrição de outras informações"
        self.createEventButton.setTitle("Criar Evento", for: .normal)
    }
    
}

// MARK: Navigation Bar Customization
extension CreateNewEventViewController {
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
}

