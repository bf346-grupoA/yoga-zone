//
//  TesteTableViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 26/02/22.
//

import UIKit

class TesteTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    let myData = ["first", "second", "third", "four","five"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "EventoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "EventoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return myData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventoTableViewCell", for: indexPath) as! EventoTableViewCell
        //cell.myLabel.text = myData[indexPath.row]
        //cell.myImageView.backgroundColor = .red
        self.tableView.sizeToFit()
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
