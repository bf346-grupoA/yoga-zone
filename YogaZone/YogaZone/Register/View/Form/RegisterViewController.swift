//
//  RegisterViewController.swift
//  YogaZone
//
//  Created by Marcus. Edited by Philippe Muniz Gomes on 02/06/22.
//

import UIKit

class RegisterViewController: UIViewController, UIGestureRecognizerDelegate {
    
    private var arrayRegister:[String] = ["Digite seu e-mail", "Qual sera o seu Nick?", "Digite sua senha", "Confirme sua senha"]
  
    @IBOutlet weak var userAvatarImaveView: UIImageView!
    @IBOutlet weak var addPictureLabel: UILabel!
    @IBOutlet weak var formTableView: UITableView!
    @IBOutlet weak var finishRegistrationButton: UIButton!
    @IBOutlet weak var cameraIconImageView: UIImageView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImages()
        setupTableView()
        setupUI()
        setupNavigationBar()
    }
    
    func setupUI(){
        setupRegistrationButton()
        addPictureLabel.font = UIFont(name: "Comfortaa-Bold", size: 16)
    }
    
    private func setupTableView(){
        self.formTableView.delegate = self
        self.formTableView.dataSource = self
        self.formTableView.separatorStyle = .none
        
        registerCells()
    }
    
    private func registerCells() {
        self.formTableView.register(FormFieldCell.getNib(),
                                forCellReuseIdentifier: FormFieldCell.identifier)
    }
    
    private func setupNavigationBar(){
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4784313725, green: 0.4784313725, blue: 0.4784313725, alpha: 1)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "arrowVoltar"),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
    }
    
    private func setupImages() {
        userAvatarImaveView.image = UIImage(named: "person")
        cameraIconImageView.image = UIImage(named: "cameraIcon")
    }
    
    private func setupRegistrationButton() {
        var containerTitle = AttributeContainer()
        containerTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        
        var configNextButton = UIButton.Configuration.filled()
        configNextButton.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        configNextButton.baseForegroundColor = .white
        configNextButton.attributedTitle = AttributedString("Finalizar Cadastro", attributes: containerTitle)
        
        self.finishRegistrationButton.configuration = configNextButton
        self.finishRegistrationButton.layer.cornerRadius = 8
        
    }
    
    @IBAction func onTapFinishRegistrationButton(_ sender: UIButton) {
        // TODO: Create User in Firebase
        // TODO: Show Alert with Operation Status (Success or Failure)
        // TODO: Pop ViewController (Login)
        self.navigationController?.popViewController(animated: true)
    }
}


extension RegisterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayRegister.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = formTableView.dequeueReusableCell(withIdentifier: FormFieldCell.identifier, for: indexPath) as? FormFieldCell
        
        cell?.formTextField.placeholder = self.arrayRegister[indexPath.row]
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


extension RegisterViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arrayRegister[indexPath.row])
    }
}

// MARK: Navigation Bar Customization
extension RegisterViewController {
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
}


