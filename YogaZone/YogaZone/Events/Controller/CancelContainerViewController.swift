//
//  CancelContainerViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 15/03/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class CancelContainerViewController:UIViewController {
    
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    let alertService = AlertService()
    let alertViewController = AlertViewController()
    let database = Firestore.firestore()
    var event: EventModel?
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        let alertVC = alertService.alert(parentVC: self, alertTitle: "Atenção!", alertDescription: "Confirmar Saída do Evento?", cancelText: "Não", confirmText: "Sim", actionType: "Cancelamento", delegate: self)
        self.present(alertVC, animated: true)
    }
    
    func setEventData(event:EventModel){
        self.event = event
    }
    
    func confirmParticipation(){
        let email = Auth.auth().currentUser?.email ?? ""
        self.event?.eventParticipants?.removeAll{ $0 == email}
        updateFirestoreData(event: self.event ?? EventModel())
    }
    
}

// MARK: UI Functions
extension CancelContainerViewController {
    func setupUI(){
        self.cancelButton.configuration = nil
        self.cancelButton.setTitle("Cancelar Participação", for: .normal)
        self.cancelButton.setTitleColor(.white, for: .normal)
        self.cancelButton.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.cancelButton.backgroundColor = #colorLiteral(red: 0.831372549, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        self.cancelButton.layer.cornerRadius = 8
        
    }
    
}

extension CancelContainerViewController: AlertDelegate {
    
    func confirmAlertPressed() {
        self.confirmParticipation()
    }
    
}

//MARK: - Firestore
extension CancelContainerViewController {
    
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
