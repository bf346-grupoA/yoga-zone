//
//  HomeViewModel.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 10/06/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class HomeViewModel {
    private var loggedUser: UserInfo?
    private let database = Firestore.firestore()
    
    
    func requestUserInfo(completion: @escaping YZFirebaseUserCallback<UserInfo>) {
        if let email = Auth.auth().currentUser?.email {
            
            self.database.collection(CommonConstants.collectionName.rawValue)
                .document(email)
                .getDocument { document, error in
                    if let document = document, document.exists {
                        let data = document.data()
                        let username = data?[OnboardingConstants.nameField.rawValue] as? String ?? ""
                        self.loggedUser = UserInfo(username: username, avatar: nil)
                        
                        completion(.success(self.loggedUser ?? UserInfo(username: "Usuário", avatar: nil)))
                        
                    } else {
                        
                        // Tratamento para erro genérico como falha de rede e similares.
                        if let error = error {
                            completion(.failure(error))
                        } else {
                            
                            // Tratamento de erro do Firebase ao não encontrar o documento do usuário
                            completion(.failure(Error.errorDescription(message: "Info de usuário não encontrada =(", error: nil)))
                        }
                        
                    }
                    
                }
            
        }
    }
    
    func getUserInfo() -> UserInfo? {
        return self.loggedUser
    }
}
