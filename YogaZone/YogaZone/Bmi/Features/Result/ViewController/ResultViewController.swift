//
//  ResultViewController.swift
//  BmiX
//
//  Created by Marcelo Silva on 22/04/22.
//

import UIKit

class ResultViewController: UIViewController , SendData {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonClosed: UIButton!
    
    var result : Double = 0
    var weigth: String = ""
    var goal: String = ""
    var missing:String = ""
    var file: [MyProgress] = []
    var myProgress: MyProgressViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    func configTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ResultTableViewCell.nib(), forCellReuseIdentifier: ResultTableViewCell.identifier)
    }
    
    @IBAction func tappedBUttonClosed(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}

extension ResultViewController:UITableViewDelegate,UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.identifier, for: indexPath) as? ResultTableViewCell
        cell?.setupCell(value:result)
        cell?.delegate = self
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        740
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
    }
}

extension ResultViewController: ResultTableViewCellProtocol{
    func actionSaveButton() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyProgressViewController") as? MyProgressViewController
        vc?.goal = goal
        vc?.weigth = weigth
        vc?.missing = missing
        print("file \(file)")
        vc?.dataProgress = file
        self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
}


