//
//  MeuPerfilVC.swift
//  YogaZone
//
//  Created by Marcus on 07/03/22.
//

import UIKit

class MyProfileVC: UIViewController, UIGestureRecognizerDelegate {
    
    private var arrayProfile:[String] = ["Nick", "Data de Nascimento", "Localidade", "Sexo"]
    
    @IBOutlet weak var perfilImage: UIImageView!
    
    @IBOutlet weak var tappedCameraIconImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var saveChangesButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configImages()
        configSaveChangeButton()
        setupNavigationBar()
    }
    
    func configImages(){
        perfilImage.image = UIImage(named: "person")
        tappedCameraIconImage.image = UIImage(named: "cameraIcon")
    }
    
    func configTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.register(MyProfileTableViewCell.nib(), forCellReuseIdentifier: MyProfileTableViewCell.identifier)
    }

    
    
    func configSaveChangeButton(){
        var containerTitle = AttributeContainer()
            containerTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        var configSaveChangesButton = UIButton.Configuration.filled()
            configSaveChangesButton.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
            configSaveChangesButton.baseForegroundColor = .white
            configSaveChangesButton.attributedTitle = AttributedString("Salvar Alterações", attributes: containerTitle)
        self.saveChangesButton.configuration = configSaveChangesButton
        self.saveChangesButton.layer.cornerRadius = 8
    }
    
    @IBAction func tappedSaveChangesButton(_ sender: UIButton) {
        CustomAlertVC.instance.showAlert(titleType: .success, message: "Suas alterações foram salvas com sucesso !", alertType: .success)
    }
    
}

extension MyProfileVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MyProfileTableViewCell? = tableView.dequeueReusableCell(withIdentifier: MyProfileTableViewCell.identifier, for: indexPath) as? MyProfileTableViewCell
        cell?.myProfileTitleCellLabel.text = self.arrayProfile[indexPath.row]
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension MyProfileVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arrayProfile[indexPath.row])
    }
}

// MARK: Navigation Bar Customization
extension MyProfileVC {
    func setupNavigationBar(){
        self.navigationItem.title = "Meu Perfil"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 16) ?? UIFont()]
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4784313725, green: 0.4784313725, blue: 0.4784313725, alpha: 1)
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


