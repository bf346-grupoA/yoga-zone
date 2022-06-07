//
//  RegisterViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 02/06/22.
//

import UIKit

enum Dimensions: CGFloat {
    case PROFILE_IMAGE_PICKER = 100
    case PROFILE_IMAGE_CELL = 50
}

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
            NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 16) ?? UIFont()
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

// MARK: Firebase Delegate
extension RegisterViewController: FirebaseOperationsDelegate {
    
    func register() {
        if let result = self.viewModel?.register() {
            self.alert?.setup(
                title: result.isError ? "Ops =(" : "Cadastro Realizado =)",
                message: result.message,
                okText: "Fechar"
            )
        }
    }
    
}
