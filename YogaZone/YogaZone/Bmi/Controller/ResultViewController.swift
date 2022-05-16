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
    var missing: Float = 0
    var file: [MyProgress] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
      
        // Do any additional setup after loading the view.
    }


    func configTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        
    }
    

    @IBAction func tappedBUttonClosed(_ sender: Any) {
        self.dismiss(animated: true)
   
    }
    
}


extension ResultViewController:UITableViewDelegate,UITableViewDataSource{
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell
        cell?.setupCell(value:result)
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        740
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
    }
    

}

extension ResultViewController: MyTableViewCellProtocol{
    func actionSaveButton() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyProgressViewController") as? MyProgressViewController
        vc?.goal = goal
        vc?.weigth = weigth
        vc?.missing = missing
        self.populationArray()
        vc?.data = file
        self.present(vc ?? UIViewController(), animated: true)
    }
    
    func populationArray(){
        let stringWeight = "\(weigth) kg "
        let data: MyProgress = MyProgress(date:getDate(), result: String(format: " %.2f IMC", result), weight:stringWeight)
        file.append(data)
    }

    func getDate() -> String{
        let currentyDate = Date()
        let formater = DateFormatter()
        formater.dateStyle = .short
        let date = formater.string(from: currentyDate)
        return date
    }
    
    
}
