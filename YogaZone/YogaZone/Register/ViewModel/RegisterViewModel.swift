//
//  RegisterViewModel.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 04/06/22.
//

import Foundation
import FirebaseAuth

class RegisterViewModel {

    // MARK: Private Parameters
    private var user: UserRegistrationModel?
    private var auth: Auth?
    
    
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
