//
//  MyProgressViewController.swift
//  BmiX
//
//  Created by Marcelo Silva on 23/04/22.
//

import UIKit
import FirebaseFirestore

class MyProgressViewController: UIViewController, SendData{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var missingLabel: UILabel!
    @IBOutlet weak var closedButton: UIButton!
    
    var weigth: String = ""
    var goal: String = ""
    var missing:String = ""
    var result: Double = 0.0
    var resultVC = ResultViewController()
    var viewModel = MyProgressViewModel()
    var dataBase = Firestore.firestore()
    var dataProgress: [MyProgress] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(MyProgressTableViewCell.getNib(), forCellReuseIdentifier: MyProgressTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.updateProgress()
        self.getData()
    }
    
    
    @IBAction func tappedClosedBUtton(_ sender: UIButton) {
    }
    
    func updateProgress(){
        weightLabel.text = weigth
        goalLabel.text = goal
        missingLabel.text = missing
    }
    
    func getData(){
        dataBase.collection("progress").order(by: "postDate").getDocuments { snapshot, error in
            if error == nil{
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.dataProgress = snapshot.documents.map({ document in
                            return MyProgress(date: document["date"] as? String ?? "",
                                              result: document["result"] as? String ?? "",
                                              weight: document["weight"] as? String ?? "",
                                              goal: document["goal"] as? String ?? "")
                        })
                        self.tableView.reloadData()
                    }
                }
            } else {
                print("fail")
            }
        }
    }
}

extension MyProgressViewController:UITableViewDelegate,UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProgress.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyProgressTableViewCell.identifier, for: indexPath) as? MyProgressTableViewCell
        cell?.setupCell(myProgress: dataProgress[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
