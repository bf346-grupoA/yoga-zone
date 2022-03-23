//
//  EditEventDetailViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 15/03/22.
//

import UIKit

class EditEventDetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
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
        setupNavigationBar()
        setupUI()
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let vc = EventCreatedSuccessViewController()
        vc.titleText = "Evento Alterado!"
        vc.sucessMessage = """
        Evento alterado com sucesso !
        """
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        let alertVC = alertService.alert(parentVC: self, alertTitle: "Atenção!", alertDescription: "Confirmar Exclusão do Evento?", cancelText: "Não", confirmText: "Sim", actionType: "Exclusão")
        self.present(alertVC, animated: true)
    }
    
}

// MARK: UI Functions
extension EditEventDetailViewController {
    
    func setupNavigationBar(){
        self.navigationItem.title = "Editar Evento"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 24) ?? UIFont()]
        
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
        self.editEventButton.setTitle("Editar Evento", for: .normal)
        self.deleteEventButton.setTitle("Excluir Evento", for: .normal)
    }
    
}

// MARK: Navigation Bar Customization
extension EditEventDetailViewController {
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
}
