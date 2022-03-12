//
//  EventListViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 28/02/22.
//

import UIKit

class EventListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let myData = ["first", "second", "third", "four","five"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "EventCellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "EventCellTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
     }
        
}

extension EventListViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCellTableViewCell", for: indexPath) as? EventCellTableViewCell 
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135.0
    }
   
    
}

extension EventListViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        let vc = EventDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
