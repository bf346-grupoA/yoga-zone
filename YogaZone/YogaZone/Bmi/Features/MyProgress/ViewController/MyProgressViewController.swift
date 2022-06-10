//
//  MyProgressViewController.swift
//  BmiX
//
//  Created by Marcelo Silva on 23/04/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class MyProgressViewController: UIViewController, SendData{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var weightLabeltitle: UILabel!
    @IBOutlet weak var goalLabelTitle: UILabel!
    @IBOutlet weak var missLabelTitle: UILabel!
    @IBOutlet weak var dateLabelTitle: UILabel!
    @IBOutlet weak var resultLabelTitle: UILabel!
    @IBOutlet weak var weightLabelTitleTv: UILabel!
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
        self.tableView.register(TableViewCellMyProgress.getNib(), forCellReuseIdentifier: TableViewCellMyProgress.identifier)
        self.configLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.updateProgress()
        self.getData()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func tappedClosedBUtton(_ sender: UIButton) {
    }
    
    func updateProgress(){
        weightLabel.text = weigth
        goalLabel.text = goal
        missingLabel.text = missing
    }
    
    func getData(){
        
        if let email = Auth.auth().currentUser?.email {
            dataBase.collection(CommonConstants.collectionName.rawValue)
                .document(email)
                .collection(CommonConstants.bmiSubColletionName.rawValue)
                .order(by: "postDate")
                .getDocuments { snapshot, error in
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
                        print(CommonConstants.firestoreRetrivingDataError.rawValue)
                    }
                }
        }
    }
    
    func configLabels(){
        self.titleLabel.font = UIFont(name: "Comfortaa-Bold", size: 24)
        self.weightLabeltitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.goalLabelTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.missLabelTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.weightLabel.font = UIFont(name: "Comfortaa-Bold", size: 14)
        self.goalLabel.font = UIFont(name: "Comfortaa-Bold", size: 14)
        self.missingLabel.font = UIFont(name: "Comfortaa-Bold", size: 14)
        self.dateLabelTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.resultLabelTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.weightLabelTitleTv.font = UIFont(name: "Comfortaa-Bold", size: 16)
        
      
    }
}

extension MyProgressViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProgress.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellMyProgress.identifier, for: indexPath) as? TableViewCellMyProgress
        cell?.setupCell(myProgress: dataProgress[indexPath.row])
        return cell ?? UITableViewCell()
    }
}


