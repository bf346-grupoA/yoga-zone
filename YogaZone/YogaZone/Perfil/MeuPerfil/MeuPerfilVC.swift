//
//  MeuPerfilVC.swift
//  YogaZone
//
//  Created by Marcus on 07/03/22.
//

import UIKit

class MeuPerfilVC: UIViewController {
    
    
    private var arrayProfile:[String] = ["Nick", "Data de Nascimento", "Localidade", "Sexo"]
    
    @IBOutlet weak var tappedArrowVoltarImage: UIImageView!
    
    @IBOutlet weak var meuPerfilLabel: UILabel!
    
    @IBOutlet weak var perfilImage: UIImageView!
    
    @IBOutlet weak var tappedCameraIconImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configImages()
    }
    
    
    func configImages(){
        tappedArrowVoltarImage.image = UIImage(named: "arrowVoltarCinza")
        perfilImage.image = UIImage(named: "person")
        tappedCameraIconImage.image = UIImage(named: "cameraIcon")
    }
    
    
    func configTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.register(MeuPerfilTableViewCell.nib(), forCellReuseIdentifier: MeuPerfilTableViewCell.identifier)
    }
    
    @IBAction func moreOptionsButton(_ sender: UIButton) {
        let vc = AlterarSenhaVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MeuPerfilVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MeuPerfilTableViewCell? = tableView.dequeueReusableCell(withIdentifier: MeuPerfilTableViewCell.identifier, for: indexPath) as? MeuPerfilTableViewCell
        cell?.meuPerfilTitleCellLabel.text = self.arrayProfile[indexPath.row]
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension MeuPerfilVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arrayProfile[indexPath.row])
    }
}


