//
//  EventListViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 28/02/22.
//

import UIKit

class EventListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var eventData: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupData()
        setupUI()
    }
    
    func configureTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(EventCell.nib(), forCellReuseIdentifier: EventCell.identifier)
    }
    
}

// MARK: TableViewDataSource
extension EventListViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.identifier, for: indexPath) as? EventCell
        cell?.setupCell(event: self.eventData[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135.0
    }
    
    
}

// MARK: TableViewDelegate
extension EventListViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        let vc = EventDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: UI Functions
extension EventListViewController{
    
    func setupUI(){
        self.tableView.separatorStyle = .none
    }
    
}

// MARK: Data Mock
extension EventListViewController {
    func setupData() {
        let jsonData = eventMock.data(using: .utf8)!
        let events = try! JSONDecoder().decode([Event].self, from: jsonData)
        events.forEach { self.eventData.append($0)}
    }
}
