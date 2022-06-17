//
//  BmiViewModel.swift
//  YogaZone
//
//  Created by Marcelo Silva on 01/06/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class BmiViewModel {
    
    let fireStore = Firestore.firestore()
    var getWeight:String = ""
    var result: String = ""
    var saveGoal: String = ""
    
    func initFireStore() {
        if let email = Auth.auth().currentUser?.email {
            let docRef = fireStore.document("UserData/\(email)/bmiProgress/\(UUID().uuidString)")
            docRef.getDocument { snapshot, error in
                guard let data = snapshot?.data(), error == nil else {return}
                print(data)
            }
        }
    }
    
    func saveData() {
        if let email = Auth.auth().currentUser?.email {
            let dataPath = "UserData/\(email)/bmiProgress/\(UUID().uuidString)"
            let docRef = fireStore.document(dataPath)
            docRef.setData([
                "date": getDate(),
                "weight": getWeight,
                "result": result,
                "goal": saveGoal,
                "postDate": Date().timeIntervalSince1970
            ])
        }
    }
    
    func getDate() -> String{
        let currentyDate = Date()
        let formater = DateFormatter()
        formater.dateStyle = .short
        formater.dateFormat = "dd/MM/yy"
        let date = formater.string(from: currentyDate)
        return date
    }
}
