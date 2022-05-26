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
    var idSegment:Int = 0
    var filterData:EventFilter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData(filter: filterData)
        configureTableView()
        setupUI()
    }
    
    func configureTableView(){
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(EventCell.nib(), forCellReuseIdentifier: EventCell.identifier)
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
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135.0
    }
    
    
}

// MARK: TableViewDelegate
extension EventListViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "EventDetail", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "EventDetailViewController") as?  EventDetailViewController
        
        vc?.event = eventData[indexPath.row]
        
        navigationController?.pushViewController(vc ?? EventDetailViewController(), animated: true)
    }
    
}

// MARK: UI Functions
extension EventListViewController{
    
    func setupUI(){
        self.tableView?.separatorStyle = .none
    }
    
}

// MARK: Data Mock
extension EventListViewController {
    func setupData(filter: EventFilter?) {
        self.eventData.removeAll()
        do {
            let jsonData = eventMock.data(using: .utf8)
            let events = try JSONDecoder().decode([Event].self, from: jsonData ?? Data() )
            events.forEach { self.eventData.append($0)}
        } catch {
            print(error)
        }
        
        if idSegment == 0 {
            eventData = eventData.filter({ Event in
                Event.isOwner == false && Event.isParticipating == false
            })
        } else if idSegment == 2 {
            eventData = eventData.filter({ Event in
                Event.isOwner == true || Event.isParticipating == true
            })
        }
        
        if (filter != nil) {
            if ( filter?.title != nil || filter?.local != nil || filter?.startDate != nil || filter?.endDate != nil || filter?.isOwner != nil || filter?.isParticipating != nil ){
                eventData = searchFilter(filter)
            }
        }
        
        self.tableView?.reloadData()
        
    }
    
    func searchFilter(_ filter: EventFilter?) -> [Event]{
        var searchResults = eventData.filter({ Event -> Bool in
            let title = Event.title.range(of: filter?.title ?? "", options: NSString.CompareOptions.caseInsensitive)
            let local = Event.local.range(of: filter?.local ?? "", options: NSString.CompareOptions.caseInsensitive)
            //let startDate = Event.startTime
            let isOwner = filter?.isOwner ?? false
            return title != nil || local != nil || isOwner}
        )
        return searchResults
    }
    
}
