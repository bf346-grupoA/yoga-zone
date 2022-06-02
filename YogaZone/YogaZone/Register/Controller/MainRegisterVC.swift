//
//  MainRegisterVC.swift
//  YogaZone
//
//  Created by Marcus on 14/03/22.
//

import UIKit

class MainRegisterVC: UIViewController, UIGestureRecognizerDelegate {
    
    private var arrayRegister:[String] = ["Digite seu e-mail", "Qual sera o seu Nick?", "Digite sua senha", "Confirme sua senha"]

    
    @IBOutlet weak var textAddPictureLabel: UILabel!
    
    @IBOutlet weak var perfilImage: UIImageView!
    
    @IBOutlet weak var tappedCameraIconImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configImages()
        configTableView()
        setupUI()
        setupNavigationBar()
    }
    
    func configTableView(){
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.separatorStyle = .none
            self.tableView.register(CustomMainRegisterCell.nib(), forCellReuseIdentifier: CustomMainRegisterCell.identifier)
        }
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4784313725, green: 0.4784313725, blue: 0.4784313725, alpha: 1)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "arrowVoltar"),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
    }
    
    func configImages(){
            perfilImage.image = UIImage(named: "person")
            tappedCameraIconImage.image = UIImage(named: "cameraIcon")
        }
    
    
    func configLvlButtons(){
        var containerTitle = AttributeContainer()
            containerTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        
        var configNextButton = UIButton.Configuration.filled()
            configNextButton.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
            configNextButton.baseForegroundColor = .white
            configNextButton.attributedTitle = AttributedString("Avançar", attributes: containerTitle)
        
        self.nextBtn.configuration = configNextButton
        self.nextBtn.layer.cornerRadius = 8

    }
    
    func setupUI(){
            configLvlButtons()
            textAddPictureLabel.font = UIFont(name: "Comfortaa-Bold", size: 16)
    }
    
    @IBAction func nextPageButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(UserLevelVC(), animated: true)
    }
}


extension MainRegisterVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayRegister.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CustomMainRegisterCell? = tableView.dequeueReusableCell(withIdentifier: CustomMainRegisterCell.identifier, for: indexPath) as? CustomMainRegisterCell
        cell?.registerUserTextField.placeholder = self.arrayRegister[indexPath.row]
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


extension MainRegisterVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arrayRegister[indexPath.row])
    }
}

// MARK: Navigation Bar Customization
extension MainRegisterVC {
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
}
    
