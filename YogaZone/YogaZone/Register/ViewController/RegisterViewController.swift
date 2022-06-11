//
//  RegisterViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 02/06/22.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: Private Parameters
    private var viewModel: RegisterViewModel?
    private var registerView: RegisterView?
    private var alert: AlertController?
    
    
    public init(with viewModel: RegisterViewModel = RegisterViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        self.alert = AlertController(controller: self)
        self.registerView = RegisterView(delegate: self)
        self.view = self.registerView
    }

    
}

// MARK: Navigation Bar Customization

extension RegisterViewController: UIGestureRecognizerDelegate {
    
    func setupNavigationBar() {
        self.navigationItem.title = "Crie sua conta"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 20) ?? UIFont()
        ]
        
        self.navigationController?.navigationBar.tintColor = .yogaMediumGray
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "arrowVoltar"),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
    }
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: Firebase Delegate and Form Actions
extension RegisterViewController: FormInputDelegate {
    
    func getUser(user: UserRegistrationModel) {
        self.viewModel?.setUser(formUser: user)
    }
    
    func submit() {
        self.viewModel?.register { result in
            switch result {
            case .success(let response):
                self.handleSuccess(with: response)
            case .failure(let error):
                guard let yzError = error as? YZError else {
                    self.notifyUser(withTitle: "Deu Ruim ein =(", withMessage: "A conta já está em uso por outra pessoa =(")
                    return
                }
                    
                self.handleError(with: yzError)
            }
        }
         
    }
    
    private func handleSuccess(with response: UserResponseDto) {
        self.notifyUser(
            withTitle: "Deu tudo certo \(response.user.displayName ?? "")!",
            withMessage: "Agora é só fazer o login e ser feliz =)"
        )
    }
    
    private func handleError(with error: YZError) {
        let customMessage = error.localizedDescription.contains("in use by another account") ?
                            "Essa conta já está em uso.\nTente outro e-mail =)":
                            error.localizedDescription
        
        self.notifyUser(withTitle: "Deu Ruim ein =(", withMessage: customMessage)
    }
    

    private func notifyUser(withTitle title: String, withMessage message: String) {
        self.alert?.setup(
            title: title,
            message: message
        )
    }
    
}
