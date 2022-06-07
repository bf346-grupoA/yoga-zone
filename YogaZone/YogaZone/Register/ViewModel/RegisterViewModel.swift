//
//  RegisterViewModel.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 04/06/22.
//

import Foundation
import FirebaseAuth

struct Response {
    var message: String
    var isError: Bool
}

class RegisterViewModel {

    // MARK: Public Parameters
    
    // MARK: Private Parameters
    private var user: UserRegistrationModel?
    private var auth: Auth?
    
    // MARK: Initializer
    init() {
        self.auth = Auth.auth()
    }
    
    func register() -> Response {
        var response = Response(message: "", isError: false)
        guard let email = user?.email, let password = user?.password else { return response }
        
        self.auth?.createUser(withEmail: email, password: password, completion: { (result, error) in
            if(error != nil) {
                response.isError = true
                response.message = error?.localizedDescription ?? "Unknown Error"
                
            } else {
                response.message = "Cadastro Realizado com Sucesso"
            }
        })
        
        return response
        
    }
    
    public func setUser(formUser: UserRegistrationModel) {
        self.user = UserRegistrationModel(
            email: formUser.email,
            name: formUser.name,
            nickName: formUser.nickName,
            password: formUser.password
        )
    }
    
}
