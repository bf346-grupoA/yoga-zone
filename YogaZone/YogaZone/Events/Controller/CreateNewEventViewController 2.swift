//
//  CreateNewEventController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 19/02/22.
//

import UIKit

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
        
        self.eventStartTimeTextField.textContentType = .dateTime
        self.eventNumberOfParticipantsTextField.keyboardType = .numberPad
        
        self.createEventButton.configuration = nil
        self.createEventButton.setTitle("Criar Evento", for: .normal)
        self.createEventButton.setTitleColor(.white, for: .normal)
        self.createEventButton.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.createEventButton.layer.cornerRadius = 8
        self.createEventButton.backgroundColor = #colorLiteral(red: 0.7843137255, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
        self.createEventButton.isEnabled = false
        
        self.eventNameTextField.layer.cornerRadius = 6
        self.eventDateTextField.layer.cornerRadius = 6
        self.eventStartTimeTextField.layer.cornerRadius = 6
        self.eventNumberOfParticipantsTextField.layer.cornerRadius = 6
        self.eventLocalTextField.layer.cornerRadius = 6
        self.eventDescriptionTextField.layer.cornerRadius = 6
        
        self.eventNameTextField.layer.borderWidth = 0.5
        self.eventDateTextField.layer.borderWidth = 0.5
        self.eventStartTimeTextField.layer.borderWidth = 0.5
        self.eventNumberOfParticipantsTextField.layer.borderWidth = 0.5
        self.eventLocalTextField.layer.borderWidth = 0.5
        self.eventDescriptionTextField.layer.borderWidth = 0.5
        
        self.eventNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.eventDateTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.eventStartTimeTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.eventNumberOfParticipantsTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.eventLocalTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.eventDescriptionTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        self.eventNameTextField.delegate = self
        self.eventDateTextField.delegate = self
        self.eventStartTimeTextField.delegate = self
        self.eventNumberOfParticipantsTextField.delegate = self
        self.eventLocalTextField.delegate = self
        self.eventDescriptionTextField.delegate = self
    }
    
}

// MARK: Navigation Bar Customization
extension CreateNewEventViewController {
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: Input Fields Delegate
extension CreateNewEventViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case self.eventNameTextField:
            if self.eventNameTextField.text == ""{
                setRedBorder(textField: textField)
            }else{
                setNormalBorder(textField: textField)
            }
            
        case self.eventDateTextField:
            if self.eventDateTextField.text == ""{
                setRedBorder(textField: textField)
            }else{
                setNormalBorder(textField: textField)
            }
            
        case self.eventStartTimeTextField:
            if self.eventStartTimeTextField.text == ""{
                setRedBorder(textField: textField)
            }else{
                setNormalBorder(textField: textField)
            }
            
        case self.eventNumberOfParticipantsTextField:
            if self.eventNumberOfParticipantsTextField.text == ""{
                setRedBorder(textField: textField)
            }else{
                setNormalBorder(textField: textField)
            }
            
        case self.eventLocalTextField:
            if self.eventLocalTextField.text == ""{
                setRedBorder(textField: textField)
            }else{
                setNormalBorder(textField: textField)
            }
            
        default:
            if self.eventDescriptionTextField.text == ""{
                setRedBorder(textField: textField)
            }else{
                setNormalBorder(textField: textField)
            }
        }
        
        if self.eventNameTextField.text != "" &&
            self.eventDateTextField.text != "" &&
            self.eventStartTimeTextField.text != "" &&
            self.eventNumberOfParticipantsTextField.text != "" &&
            self.eventLocalTextField.text != "" &&
            self.eventDescriptionTextField.text != ""  {
            
            self.createEventButton.isEnabled = true
            self.createEventButton.backgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
            
        } else {
            
            self.createEventButton.isEnabled = false
            self.createEventButton.backgroundColor = #colorLiteral(red: 0.7843137255, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
            
        }
        
    }
    
    func setRedBorder(textField: UITextField){
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1.0
    }
    
    func setNormalBorder(textField: UITextField){
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
