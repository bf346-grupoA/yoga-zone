//
//  MeuPerfilVC.swift
//  YogaZone
//
//  Created by Marcus on 07/03/22.
//

import UIKit

class MyProfileVC: UIViewController {
    
    
    private var arrayProfile:[String] = ["Nick", "Data de Nascimento", "Localidade", "Sexo"]
    
    @IBOutlet weak var tappedArrowVoltarImage: UIImageView!
    
    @IBOutlet weak var meuPerfilLabel: UILabel!
    
    @IBOutlet weak var perfilImage: UIImageView!
    
    @IBOutlet weak var tappedCameraIconImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tappedMoreOptionsButtonImage: UIImageView!
    
    @IBOutlet weak var saveChangesButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configImages()
        configBackButton()
        configMoreOptionsButton()
        configSaveChangeButton()
    }
    
    
    func configImages(){
        tappedArrowVoltarImage.image = UIImage(named: "arrowVoltarCinza")
        tappedMoreOptionsButtonImage.image = UIImage(named: "moreOptions")
        perfilImage.image = UIImage(named: "person")
        tappedCameraIconImage.image = UIImage(named: "cameraIcon")
    }
    
    func configTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.register(MyProfileTableViewCell.nib(), forCellReuseIdentifier: MyProfileTableViewCell.identifier)
    }
    
    private func configBackButton(){
        let tapBackButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedBackButton))
        self.tappedArrowVoltarImage.addGestureRecognizer(tapBackButton)
        self.tappedArrowVoltarImage.isUserInteractionEnabled = true
        
    }
    
    @objc func tappedBackButton(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    private func configMoreOptionsButton(){
        let tapMoreOptionsButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedMoreOptionsButton))
        self.tappedMoreOptionsButtonImage.addGestureRecognizer(tapMoreOptionsButton)
        self.tappedMoreOptionsButtonImage.isUserInteractionEnabled = true
        
    }
    
    @objc func tappedMoreOptionsButton(){
        self.navigationController?.pushViewController(MoreOptionsVC(), animated: true)
        
    }
    
    func configSaveChangeButton(){
        saveChangesButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
        saveChangesButton.clipsToBounds = true // Rounded 🙂
        saveChangesButton.layer.cornerRadius = 7.5
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
        cell?.meuPerfilTitleCellLabel.text = self.arrayProfile[indexPath.row]
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


