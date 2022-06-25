//
//  EventListViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 28/02/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class EventListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var eventData: [EventModel] = []
    var idSegment:Int = 0
    var filterData:EventFilter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.setupData(filter: self.filterData)
        self.setupUI()
     }
    
    override func viewWillAppear(_ animated: Bool) {
    
    }
    
    
    func configureTableView(){
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(EventCell.nib(), forCellReuseIdentifier: EventCell.identifier)
        self.tableView?.register(EmptyEventCell.nib(), forCellReuseIdentifier: EmptyEventCell.identifier)
    }
    
}

// MARK: TableViewDataSource
extension EventListViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.eventData.isEmpty {
            return 1
        } else {
            return self.eventData.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.eventData.isEmpty {
            self.tableView.isScrollEnabled = false
            let cell = tableView.dequeueReusableCell(withIdentifier: EmptyEventCell.identifier, for: indexPath) as? EmptyEventCell
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
        } else {
            self.tableView.isScrollEnabled = true
            let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.identifier, for: indexPath) as? EventCell
            cell?.setupCell(event: self.eventData[indexPath.row])
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.eventData.isEmpty {
            return 400.0
        } else {
            return 135.0
        }
    }
    
}

// MARK: TableViewDelegate
extension EventListViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if !self.eventData.isEmpty {
            let storyboard = UIStoryboard(name: "EventDetail", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "EventDetailViewController") as? EventDetailViewController
            
            vc?.event = eventData[indexPath.row]
            
            navigationController?.pushViewController(vc ?? EventDetailViewController(), animated: true)
        }
        
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
        
        let database = Firestore.firestore()
      
            database.collection(EventsConstants.eventCollectionName.rawValue).getDocuments { querySnapshot, error in
                
                if let e = error {
                    print("\(CommonConstants.firestoreRetrivingDataError.rawValue) \(e.localizedDescription)")
                } else {
                    guard let documents = querySnapshot?.documents else {
                        print("No documents")
                        return
                    }
                    
                    self.eventData = documents.compactMap({ queryDocumentSnapshot -> EventModel? in
                        return try? queryDocumentSnapshot.data(as: EventModel.self)
                    })
                    
                    /*
                     for document in querySnapshot!.documents {
                     print("\(document.documentID) => \(document.data())");
                     
                     }*/
                }
                
                let email = Auth.auth().currentUser?.email ?? ""
                
                for i in self.eventData.indices {
                    
                    self.eventData[i].isOwner = false
                    self.eventData[i].isParticipating = false
                    
                    if self.eventData[i].creator == email{
                        self.eventData[i].isOwner = true
                    }
                    
                    for z in (self.eventData[i].eventParticipants ?? []).indices {
                        if self.eventData[i].eventParticipants?[z] == email {
                            self.eventData[i].isParticipating = true
                            break
                        }
                    }
                    
                }
                
                if self.idSegment == 0 {
                    self.eventData = self.eventData.filter({ event in
                        event.isOwner == false && event.isParticipating == false
                    })
                } else if self.idSegment == 2 {
                    self.eventData = self.eventData.filter({ event in
                        event.isOwner == true || event.isParticipating == true
                    })
                }
                
                if (filter != nil) {
                    self.eventData = self.searchFilter(filter)
                }
                
              
                self.tableView.reloadData()
                
            }
        
    }
    
    func setupData2(filter: EventFilter?) {
        
        self.eventData.removeAll()
        
        do {
            let jsonData = eventMock.data(using: .utf8)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(Formatter.dateFormatterPtBr)
            let events = try decoder.decode([EventModel].self, from: jsonData ?? Data() )
            events.forEach { self.eventData.append($0)}
        } catch {
            print(error)
        }
        
        if idSegment == 0 {
            eventData = eventData.filter({ event in
                event.isOwner == false && event.isParticipating == false
            })
        } else if idSegment == 2 {
            eventData = eventData.filter({ event in
                event.isOwner == true || event.isParticipating == true
            })
        }
        
        if (filter != nil) {
            eventData = searchFilter(filter)
        }
        
        self.tableView?.reloadData()
        
    }
    
    func searchFilter(_ filter: EventFilter?) -> [EventModel]{
        var searchResults:[EventModel]
        
        let local = filter?.local ?? ""
        //Double condition, in case filter.local is nil, it will always be true, and return all the items in the list
        //Case something is found with the text in range, it will return the events with the filter applied
        searchResults = eventData.filter({ filter?.local == nil || $0.local?.range(of: local, options: NSString.CompareOptions.caseInsensitive) != nil })
        
        let title = filter?.title ?? ""
        if !(filter?.title?.isEmpty ?? true) {
            //removes all occurences that are different from the filter result, wich is the text we are trying to find (== nil)
            searchResults.removeAll { $0.title?.range(of: title, options:  NSString.CompareOptions.caseInsensitive) == nil }
        }
        
        if (filter?.startDate != nil && filter?.endDate != nil ){
            let range = (filter?.startDate ?? Date())...(filter?.endDate ?? Date())
            searchResults.removeAll(where: { !range.contains($0.date ?? Date()) } )
        }
        
        if filter?.isOwner != false && filter?.isOwner != nil {
            searchResults.removeAll(where: { !($0.isOwner ?? false) == filter?.isOwner } )
        }
        
        if filter?.isAvaliable != false && filter?.isAvaliable != nil {
            searchResults.removeAll(where: { ($0.maximumOfParticipants ?? 0) - ($0.numberOfParticipants ?? 0) == 0 } )
        }
        
        return searchResults
    }
    
}

