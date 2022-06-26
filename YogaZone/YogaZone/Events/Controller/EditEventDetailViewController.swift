//
//  EditEventDetailViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 15/03/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class EditEventDetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    
    @IBOutlet weak var eventStartTimeTextField: UITextField!
    @IBOutlet weak var eventNumberOfParticipantsTextField: UITextField!
    @IBOutlet weak var numberOfParticipantsErrorLabel: UILabel!
    @IBOutlet weak var eventLocalTextField: UITextField!
    @IBOutlet weak var eventDescriptionTextField: UITextField!
    @IBOutlet weak var editEventButton: UIButton!
    @IBOutlet weak var deleteEventButton: UIButton!
    
    let alertService = AlertService()
    let database = Firestore.firestore()
    var event: EventModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        createTimePicker()
        setupUI()
        loadCurrentEventData()
    }
    
    // MARK: UIPickers Implementation
    let datePicker = UIDatePicker()
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let vc = EventCreatedSuccessViewController()
        vc.titleText = "Evento Alterado!"
        vc.sucessMessage = """
        Evento alterado com sucesso !
        """
        
        let event = EventModel(id: event?.id,
                               title: eventNameTextField.text ?? "",
                               local: eventLocalTextField.text ?? "",
                               date: eventDatePicker.date,
                               description: eventDescriptionTextField.text ?? "",
                               isOwner: nil,
                               isParticipating: nil,
                               numberOfParticipants: event?.numberOfParticipants ?? 0,
                               maximumOfParticipants: Int(eventNumberOfParticipantsTextField.text ?? "") ?? 0,
                               startTime: eventStartTimeTextField.text ?? "",
                               creator: event?.creator ?? "",
                               eventParticipants: event?.eventParticipants ?? [])
        
        self.updateFirestoreData(event: event)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        let alertVC = alertService.alert(parentVC: self, alertTitle: "Atenção!", alertDescription: "Confirmar Exclusão do Evento?", cancelText: "Não", confirmText: "Sim", actionType: "Exclusão", delegate: self)
        self.present(alertVC, animated: true)
    }
    
}

extension EditEventDetailViewController: AlertDelegate {
    
    func confirmAlertPressed() {
        self.deleteFirestoreData(event: self.event ?? EventModel())
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
        self.eventDateLabel.text = "Data do evento"
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
        
        self.editEventButton.configuration = nil
        self.editEventButton.setTitle("Confirmar Alterações", for: .normal)
        self.editEventButton.setTitleColor(.white, for: .normal)
        self.editEventButton.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.editEventButton.backgroundColor = #colorLiteral(red: 0.7843137255, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
        self.editEventButton.layer.cornerRadius = 8
        self.editEventButton.isEnabled = false
        
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
        
        self.eventNameTextField.delegate = self
        self.eventStartTimeTextField.delegate = self
        self.eventNumberOfParticipantsTextField.delegate = self
        self.eventLocalTextField.delegate = self
        self.eventDescriptionTextField.delegate = self
        
        self.deleteEventButton.configuration = nil
        self.deleteEventButton.setTitle("Excluir Evento", for: .normal)
        self.deleteEventButton.setTitleColor(.white, for: .normal)
        self.deleteEventButton.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.deleteEventButton.backgroundColor = #colorLiteral(red: 0.831372549, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        self.deleteEventButton.layer.cornerRadius = 8
        
    }
    
    func loadCurrentEventData() {
        self.eventNameTextField.text = event?.title
        self.eventDatePicker.date = event?.date ?? Date()
        self.eventStartTimeTextField.text = event?.startTime
        self.eventNumberOfParticipantsTextField.text = String(event?.maximumOfParticipants ?? 0)
        self.eventLocalTextField.text = event?.local
        self.eventDescriptionTextField.text = event?.description
    }
    
}

// MARK: Navigation Bar Customization
extension EditEventDetailViewController {
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: Input Fields Delegate
extension EditEventDetailViewController: UITextFieldDelegate {
    
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
            self.eventNumberOfParticipantsTextField.text != "" &&
            self.eventLocalTextField.text != "" &&
            self.eventDescriptionTextField.text != ""  {
            
            self.editEventButton.isEnabled = true
            self.editEventButton.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.6588235294, blue: 0.3254901961, alpha: 1)
            
        } else {
            
            self.editEventButton.isEnabled = false
            self.editEventButton.backgroundColor = #colorLiteral(red: 0.7843137255, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
            
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
extension EditEventDetailViewController {
    
    func deleteFirestoreData(event:EventModel) {
        
        let id = event.id ?? "0"
        database.collection(EventsConstants.eventCollectionName.rawValue)
            .document(id)
            .delete { error in
            if let error = error {
                print("Error removing document: \(error)")
            } else {
                print("Document successfully removed!")
            }
        }
        
    }
    
    func updateFirestoreData(event:EventModel) {
        
        let id = event.id ?? "0"
        let docRef = database.collection(EventsConstants.eventCollectionName.rawValue).document(id)
        do {
            try docRef.setData(from: event)
            print(CommonConstants.firestoreDataSavedWithSuccess.rawValue)
        } catch {
            print("\(CommonConstants.firestoreErrorSavingData.rawValue) \(error.localizedDescription)")
        }
        
    }
    
}
