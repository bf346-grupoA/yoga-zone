//
//  HistoricoController.swift
//  YogaZone
//
//  Created by Marcelo Silva on 19/02/22.
//

import UIKit

private let indentifier = "HistoricoTableViewCell"
class HistoricoController: UIViewController {

    @IBOutlet weak var historicoTableView: UITableView!
    @IBOutlet weak var pesoAtualLabel: UILabel!
    
    @IBOutlet weak var faltamLabel: UILabel!
    @IBOutlet weak var obejtivoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        
    }

    @IBAction func tappedShare(_ sender: Any) {
    let VcShare = UIActivityViewController(activityItems: ["ŸogaZone.com"], applicationActivities: nil)
        VcShare.popoverPresentationController?.sourceView = self.view
        self.present(VcShare, animated: true, completion: nil)
        
    }
}

extension HistoricoController{
    
    func setupTableView(){
        self.historicoTableView.delegate = self
        self.historicoTableView.dataSource = self
    
        let nib = UINib(nibName: indentifier , bundle: nil)
        self.historicoTableView.register(nib, forCellReuseIdentifier: indentifier)
    }

}

extension HistoricoController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.historicoTableView.dequeueReusableCell(withIdentifier: indentifier) as? HistoricoTableViewCell
        cell?.dateLabel.text = "01/01/2022"
        cell?.resultLabel.text = "IMC 25.5 Kg/m2"
        cell?.weigthLabel.text = "58.0 Kg"
        cell?.remainLabel.text = "-5 Kg"
        return cell ?? UITableViewCell()
    }
}

extension HistoricoController:UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}


