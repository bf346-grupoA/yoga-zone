//
//  HomeEventsViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 28/02/22.
//

import UIKit

class HomeEventsViewController: UIViewController, UIGestureRecognizerDelegate{
    
    @IBOutlet weak var optionsControl: UISegmentedControl!
    @IBOutlet weak var buttonFilter: UIButton!
    @IBOutlet weak var filterQuantityNotificationLabel: UILabel!
    @IBOutlet weak var buttonCreateNewEvent: UIButton!
    @IBOutlet weak var containerListView: UIView!
    @IBOutlet weak var containerMapView: UIView!
    
    private var containerViewController: EventListViewController?
    private var filterData:EventFilter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
        loadUserDefaultFilterConfiguration()
        updateFilter(filter: filterData ?? EventFilter())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        

        self.saveUserDefault(value: self.filterData?.local ?? "", key: "eventFilterDataLocal")
        self.saveUserDefault(value: self.filterData?.title ?? "", key: "eventFilterDataTitle")

        if let startDate = self.filterData?.startDate, let endDate = self.filterData?.endDate {
            self.saveUserDefault(value: startDate, key: "eventFilterDataStartDate")
            self.saveUserDefault(value: endDate, key: "eventFilterDataEndDate")
            self.saveUserDefault(value: true, key: "eventFilterDateInvtervalSelected")
        } else {
            self.saveUserDefault(value: false, key: "eventFilterDateInvtervalSelected")
        }
        
        if let isAvaliable = filterData?.isAvaliable {
            self.saveUserDefault(value: isAvaliable, key: "eventFilterDataIsFull")
        }
        
        if let isOwner = filterData?.isOwner {
            self.saveUserDefault(value: isOwner , key: "eventFilterDataIsOwner")
        }
        
        if let totalFilters = filterData?.totalFilters {
            self.saveUserDefault(value: totalFilters, key: "eventFilterTotalQuantity")
        }
        
    }
    
    @IBAction func filterButtonTapped(_ sender: UIButton) {
        let vc = EventFilterViewController()
        vc.delegate(delegate: self)
        vc.setFilterData(filterData: self.filterData ?? EventFilter())
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func createEventButtonTapped(_ sender: UIButton) {
        let vc = CreateNewEventViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapSegment(segment: UISegmentedControl){
        switch segment.selectedSegmentIndex {
        case 0:
            self.containerListView.isHidden = false
            self.containerMapView.isHidden = true
            containerViewController?.idSegment = 0
            containerViewController?.setupData(filter: filterData)
            containerViewController?.configureTableView()
        case 1:
            self.containerMapView.isHidden = false
            self.containerListView.isHidden = true
        default:
            self.containerListView.isHidden = false
            self.containerMapView.isHidden = true
            containerViewController?.idSegment = 2
            containerViewController?.setupData(filter: filterData)
            containerViewController?.configureTableView()
        }
        
    }
    
    
}

// MARK: UI Functions
extension HomeEventsViewController {
    
    func setupNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Eventos"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 24) ?? UIFont()]
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4784313725, green: 0.4784313725, blue: 0.4784313725, alpha: 1)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "arrowVoltar"),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
    }
    
    func setupUI(){
        
        containerMapView.isHidden = true
        
        self.optionsControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Montserrat-Medium", size: 13) ?? UIFont() ], for: .normal)
        self.optionsControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Montserrat-Bold", size: 13) ?? UIFont()], for: .selected)
        
        self.buttonFilter.setImage(UIImage(named:"sliders-white"), for: .normal)
        self.buttonFilter.semanticContentAttribute = .forceLeftToRight
        
        self.filterQuantityNotificationLabel.layer.cornerRadius = 10
        self.filterQuantityNotificationLabel.clipsToBounds = true
        self.filterQuantityNotificationLabel.layer.borderColor = UIColor.black.cgColor
        self.filterQuantityNotificationLabel.backgroundColor = #colorLiteral(red: 0.9465729594, green: 0.2218600512, blue: 0.2172786891, alpha: 1)
        self.filterQuantityNotificationLabel.textColor = .white
        self.filterQuantityNotificationLabel.textAlignment = .center
        
        self.buttonCreateNewEvent.setImage(UIImage(named:"circle-plus-white"), for: .normal)
        self.buttonCreateNewEvent.semanticContentAttribute = .forceLeftToRight
        
        self.buttonFilter.configuration?.imagePadding = 5
        self.buttonCreateNewEvent.configuration?.imagePadding = 5
        
        let eventsCustomTitle = NSMutableAttributedString(string: "Filtros", attributes: [
            NSAttributedString.Key.font: UIFont(name: "Montserrat-Bold", size: 13) ?? UIFont(),
        ])
        
        let createNewEventCustomTitle = NSMutableAttributedString(string: "Criar Novo Evento", attributes: [
            NSAttributedString.Key.font: UIFont(name: "Montserrat-Bold", size: 13) ?? UIFont(),
        ])
        
        self.buttonFilter.setAttributedTitle(eventsCustomTitle, for: .normal)
        self.buttonCreateNewEvent.setAttributedTitle(createNewEventCustomTitle, for: .normal)
        
        self.optionsControl.setTitle("Lista", forSegmentAt: 0)
        self.optionsControl.setTitle("Mapa", forSegmentAt: 1)
        self.optionsControl.setTitle("Meus Eventos", forSegmentAt: 2)
        self.optionsControl.apportionsSegmentWidthsByContent = true
        
    }
    
}

// MARK: Container View Segue
extension HomeEventsViewController {
    //Acessando os dados que estão dentro do Container View na home
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEventList" {
            containerViewController = segue.destination as? EventListViewController
        }
    }
    
}

// MARK: Navigation Bar Customization
extension HomeEventsViewController {
    
    @objc private func popToPrevious() {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

//MARK: - EventFilterDelegate
extension HomeEventsViewController:EventFilterDelegate {
    
    func updateFilter(filter: EventFilter) {
        self.filterData = filter
        let totalFilters = self.filterData?.totalFilters
        if totalFilters == 0 || totalFilters == nil {
            self.filterQuantityNotificationLabel.isHidden = true
        } else {
            self.filterQuantityNotificationLabel.isHidden = false
            self.filterQuantityNotificationLabel.text = String(totalFilters ?? 0)
        }
        
        containerViewController?.setupData(filter: filterData)
    }
    
}

//MARK: - User Defaults
extension HomeEventsViewController {
    
    func loadUserDefaultFilterConfiguration(){
        self.filterData = EventFilter()
        
        let local = self.getUserDefaults(key: "eventFilterDataLocal") as? String
        if local != "" && local != nil {
            self.filterData?.local = local
        }
        
        let title = self.getUserDefaults(key: "eventFilterDataTitle") as? String
        if title != "" && title != nil {
            self.filterData?.title = self.getUserDefaults(key: "eventFilterDataTitle") as? String
        }
        
        let usingDate = self.getUserDefaults(key: "eventFilterDateInvtervalSelected") as? Bool
        if usingDate == true {
            self.filterData?.startDate = self.getUserDefaults(key: "eventFilterDataStartDate") as? Date
            self.filterData?.endDate = self.getUserDefaults(key: "eventFilterDataEndDate") as? Date
        }
        
        let isFull = self.getUserDefaults(key: "eventFilterDataIsFull") as? Bool
        if isFull != nil && isFull == true {
            self.filterData?.isAvaliable = isFull
        }
        
        let isOwner = self.getUserDefaults(key: "eventFilterDataIsOwner") as? Bool
        if isOwner != nil && isOwner == true {
            self.filterData?.isOwner = isOwner
        }
        
        let totalFilters = self.getUserDefaults(key: "eventFilterTotalQuantity") as? Int
        if totalFilters != nil && totalFilters != 0 {
            self.filterData?.totalFilters = totalFilters ?? 0
        }
        
    }
    
    func saveUserDefault(value: Any, key: String){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func getUserDefaults(key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    
}
