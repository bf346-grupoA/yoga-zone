//
//  MainRegisterVC.swift
//  YogaZone
//
//  Created by Marcus on 14/03/22.
//

import UIKit

class MainRegisterVC: UIViewController {
    
    private var arrayRegister:[String] = ["Digite seu e-mail", "Qual sera o seu Nick?", "Digite sua senha", "Confirme sua senha"]

    @IBOutlet weak var tappedArrowVoltarImage: UIImageView!
    
    @IBOutlet weak var textAddPictureLabel: UILabel!
    
    @IBOutlet weak var perfilImage: UIImageView!
    
    @IBOutlet weak var tappedCameraIconImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configImages()
        configTableView()
    }
    
    func configTableView(){
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.separatorStyle = .none
            self.tableView.register(CustomMainRegisterCell.nib(), forCellReuseIdentifier: CustomMainRegisterCell.identifier)
        }
    
    func configImages(){
            tappedArrowVoltarImage.image = UIImage(named: "arrowVoltarCinza")
            perfilImage.image = UIImage(named: "person")
            tappedCameraIconImage.image = UIImage(named: "cameraIcon")
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
