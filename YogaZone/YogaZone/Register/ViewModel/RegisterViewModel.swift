//
//  RegisterViewModel.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 04/06/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel {

    // MARK: Private Parameters
    private var user: UserRegistrationModel?
    private var auth: Auth?
    private let database = Firestore.firestore()
    
    
    // MARK: Initializer
    init() {
        self.auth = Auth.auth()
    }
    
    func register(completion: @escaping YZFirebaseUserCallback<UserResponseDto>) {
        guard let email = user?.email, let password = user?.password else { return }
        
        self.auth?.createUser(withEmail: email, password: password, completion: { (result, error) in
            
            if(error != nil) {
                if let error = error {
                    completion(.failure(error))
                }
            } else {
                if let user = result?.user {
                    
                    if let email = Auth.auth().currentUser?.email, let name = self.user?.name {
                        self.database.collection(CommonConstants.collectionName.rawValue)
                            .document(email)
                            .setData([
                                OnboardingConstants.nameField.rawValue : name,
                                OnboardingConstants.isOnboardingField.rawValue : true
                            ]) { (error) in
                                    if let error = error as? YZError {
                                        completion(.failure(error))
                                    } else {
                                        print(CommonConstants.firestoreDataSavedWithSuccess.rawValue)
                                    }
                                }
                    }
                    
                    completion(.success(UserResponseDto(user: user)))
                }
            }
            
        })
    
    }
    
    public func setUser(formUser: UserRegistrationModel) {
        self.user = UserRegistrationModel(
            email: formUser.email,
            name: formUser.name,
            password: formUser.password
        )
    }
    
}
