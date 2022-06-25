//
//  ConfirmContainerViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 15/03/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ConfirmContainerViewController:UIViewController {
    
    @IBOutlet weak var confirmButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    let database = Firestore.firestore()
    var event: EventModel?
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        self.confirmParticipation()
        
        let vc = EventCreatedSuccessViewController()
        vc.titleText = "Confirmado!"
        vc.sucessMessage = """
        Sua participação foi confirmada !
        Para visualiza-lo, acesse o submenu ‘Meus Eventos’ dentro de ‘Eventos’.
        """
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setEventData(event:EventModel){
        self.event = event
    }
    
    func confirmParticipation(){
        let email = Auth.auth().currentUser?.email ?? ""
        self.event?.eventParticipants?.append(contentsOf: [email])
        updateFirestoreData(event: self.event ?? EventModel())
    }
    
}

// MARK: UI Functions
extension ConfirmContainerViewController {
    func setupUI(){
        self.confirmButton.configuration = nil
        self.confirmButton.setTitle("Confirmar Participação", for: .normal)
        self.confirmButton.setTitleColor(.white, for: .normal)
        self.confirmButton.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.confirmButton.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.6588235294, blue: 0.3254901961, alpha: 1)
        self.confirmButton.layer.cornerRadius = 8
        
    }
    
}

//MARK: - Firestore
extension ConfirmContainerViewController {
    
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
