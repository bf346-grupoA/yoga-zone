//
//  CreateNewEventController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 19/02/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class CreateNewEventViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    @IBOutlet weak var eventStartTimeTextField: UITextField!
    @IBOutlet weak var eventNumberOfParticipantsTextField: UITextField!
    @IBOutlet weak var numberOfParticipantsErrorLabel: UILabel!
    @IBOutlet weak var eventLocalTextField: UITextField!
    @IBOutlet weak var eventDescriptionTextField: UITextField!
    @IBOutlet weak var createEventButton: UIButton!
    
    let database = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        createTimePicker()
        setupUI()
    }
    
    // MARK: UIPickers Implementation
    let datePicker = UIDatePicker()
    
    @IBAction func createEventButtonTapped(_ sender: UIButton) {
        
        let event = EventModel(id: "0",
                               title: eventNameTextField.text ?? "",
                               local: eventLocalTextField.text ?? "",
                               date: eventDatePicker.date,
                               description: eventDescriptionTextField.text ?? "",
                               isOwner: true,
                               isParticipating: true,
                               numberOfParticipants: 1,
                               maximumOfParticipants: Int(eventNumberOfParticipantsTextField.text ?? "") ?? 0,
                               startTime: eventStartTimeTextField.text ?? "")
        
        self.saveFirestoreData(event: event)
        
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
    
    func createToolBar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    
    @objc func donePressed(){
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "HH:mm"
        dateFormater.locale = Locale.current
        self.eventStartTimeTextField.text = dateFormater.string(from: self.datePicker.date)
        
        self.view.endEditing(true)
    }
    
    func createTimePicker() {
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.datePickerMode = .time
        
        self.eventStartTimeTextField.textAlignment = .center
        self.eventStartTimeTextField.inputView = datePicker
        self.eventStartTimeTextField.inputAccessoryView = createToolBar()
    }
    
    func setupUI(){
        self.eventNameTextField.placeholder = "Nome do evento"
        self.eventDateLabel.text = "Data do evento:"
        self.eventStartTimeTextField.placeholder = "Horário de início"
        self.eventNumberOfParticipantsTextField.placeholder = "Número de participantes"
        self.eventLocalTextField.placeholder = "Local"
        self.eventDescriptionTextField.placeholder = "Descrição de outras informações"
        
        self.eventDateLabel.font =  UIFont(name: "Comfortaa-Bold", size: 16)
        
        self.eventDatePicker.minimumDate = Date()
        
        self.eventNumberOfParticipantsTextField.keyboardType = .numberPad
        self.eventNumberOfParticipantsTextField.inputAccessoryView = createToolBar()
        
        self.numberOfParticipantsErrorLabel.isHidden = true
        self.numberOfParticipantsErrorLabel.text = "Número de participantes deve ser maior que 0"
        self.numberOfParticipantsErrorLabel.font = UIFont(name: "Comfortaa-Bold", size: 12)
        self.numberOfParticipantsErrorLabel.textColor = #colorLiteral(red: 0.9764705882, green: 0.1450980392, blue: 0.1450980392, alpha: 1)
        
        self.createEventButton.configuration = nil
        self.createEventButton.setTitle("Criar Evento", for: .normal)
        self.createEventButton.setTitleColor(.white, for: .normal)
        self.createEventButton.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.createEventButton.layer.cornerRadius = 8
        self.createEventButton.backgroundColor = #colorLiteral(red: 0.7843137255, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
        self.createEventButton.isEnabled = false
        
        self.eventNameTextField.layer.cornerRadius = 6
        self.eventStartTimeTextField.layer.cornerRadius = 6
        self.eventNumberOfParticipantsTextField.layer.cornerRadius = 6
        self.eventLocalTextField.layer.cornerRadius = 6
        self.eventDescriptionTextField.layer.cornerRadius = 6
        
        self.eventNameTextField.layer.borderWidth = 0.5
        self.eventStartTimeTextField.layer.borderWidth = 0.5
        self.eventNumberOfParticipantsTextField.layer.borderWidth = 0.5
        self.eventLocalTextField.layer.borderWidth = 0.5
        self.eventDescriptionTextField.layer.borderWidth = 0.5
        
        self.eventNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.eventStartTimeTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.eventNumberOfParticipantsTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.eventLocalTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.eventDescriptionTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        self.eventNameTextField.autocorrectionType = .no
        self.eventLocalTextField.autocorrectionType = .no
        self.eventDescriptionTextField.autocorrectionType = .no
        
        self.eventNameTextField.delegate = self
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
            if self.eventNumberOfParticipantsTextField.text == "0" {
                setRedBorder(textField: textField)
                self.numberOfParticipantsErrorLabel.isHidden = false
            }else{
                setNormalBorder(textField: textField)
                self.numberOfParticipantsErrorLabel.isHidden = true
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
            self.eventStartTimeTextField.text != "" &&
            !(self.eventNumberOfParticipantsTextField.text?.isEmpty ?? false) &&
            self.eventNumberOfParticipantsTextField.text != "0" &&
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

//MARK: - Firestore
extension CreateNewEventViewController {
    
    func saveFirestoreData(event:EventModel) {
        
        let document = database.collection(EventsConstants.eventCollectionName.rawValue).document()
        let id = document.documentID
        let email = Auth.auth().currentUser?.email ?? ""
        document.setData([
            EventsConstants.nameField.rawValue : event.title ?? "",
            EventsConstants.dateField.rawValue : event.date ?? Date(),
            EventsConstants.startTimeField.rawValue : event.startTime ?? "",
            EventsConstants.maximumOfParticipantsField.rawValue : event.maximumOfParticipants ?? 0,
            EventsConstants.addressField.rawValue : event.local ?? "",
            EventsConstants.descriptionField.rawValue : event.description ?? "",
            EventsConstants.creatorField.rawValue : email,
            EventsConstants.eventParticipantsEmail.rawValue : [email]
        ]){ (error) in
            if let e = error {
                print("\(CommonConstants.firestoreErrorSavingData.rawValue) \(e.localizedDescription)")
            } else {
                print(CommonConstants.firestoreDataSavedWithSuccess.rawValue)
            }
        }
      
    }
    
}
