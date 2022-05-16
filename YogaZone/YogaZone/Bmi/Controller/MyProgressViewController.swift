//
//  MyProgressViewController.swift
//  BmiX
//
//  Created by Marcelo Silva on 23/04/22.
//

import UIKit

class MyProgressViewController: UIViewController, SendData{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var missingLabel: UILabel!
    @IBOutlet weak var buttonShare: UIButton!
    @IBOutlet weak var closedButton: UIButton!
    
    let defaults = UserDefaults.standard
    var data: [MyProgress] = []
    var weigth: String = ""
    var goal: String = ""
    var missing:Float = 0
    var result: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonShare.layer.cornerRadius = 7
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(TableViewCellMyProgress.getNib(), forCellReuseIdentifier: TableViewCellMyProgress.identifier)
        updateProgress()
        print(data)
    
    }
    
    @IBAction func tappedButtonShare(_ sender: Any) {
        let vcShare = UIActivityViewController(activityItems: ["YogaZone.IMC"], applicationActivities: nil)
        vcShare.popoverPresentationController?.sourceView = self.view
        self.present(vcShare, animated: true, completion: nil)
        
    
    }
    
    @IBAction func tappedClosedBUtton(_ sender: UIButton) {
      
        
        
        
    }
    
    
    
    func updateProgress(){
        weightLabel.text = weigth
        goalLabel.text = goal
        missingLabel.text =  String(format: "%.1f", missing)
    }
}

extension MyProgressViewController:UITableViewDelegate,UITableViewDataSource{
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellMyProgress.identifier, for: indexPath) as? TableViewCellMyProgress
        cell?.setupCell(myProgress: data[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.data.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .top)
        self.tableView.reloadData()
        
    }
    
    
    
    
}
