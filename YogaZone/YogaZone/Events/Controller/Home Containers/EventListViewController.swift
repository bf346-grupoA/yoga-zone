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
        let vc = storyboard.instantiateViewController(identifier: "EventDetailViewController") as? EventDetailViewController
        
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
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(Formatter.dateFormatterPtBr)
            let events = try decoder.decode([Event].self, from: jsonData ?? Data() )
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
            if ( filter?.title != nil || filter?.local != nil || filter?.startDate != nil || filter?.endDate != nil ){
                eventData = searchFilter(filter)
            }
        }
        
        self.tableView?.reloadData()
        
    }
    
    func searchFilter(_ filter: EventFilter?) -> [Event]{
        var searchResults:[Event]
        
        let local = filter?.local ?? ""
        //Double condition, in case filter.local is nil, it will always be true, and return all the items in the list
        //Case something is found with the text in range, it will return the events with the filter applied
        searchResults = eventData.filter({ filter?.local == nil || $0.local.range(of: local, options: NSString.CompareOptions.caseInsensitive) != nil })
        
        let title = filter?.title ?? ""
        if !(filter?.title?.isEmpty ?? true) {
            //removes all occurences that are different from the filter result, wich is the text we are trying to find (== nil)
            searchResults.removeAll { $0.title.range(of: title, options:  NSString.CompareOptions.caseInsensitive) == nil }
        }
        
        return searchResults
    }
    
}

