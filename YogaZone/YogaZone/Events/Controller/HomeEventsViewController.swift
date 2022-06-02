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
    @IBOutlet weak var buttonCreateNewEvent: UIButton!
    @IBOutlet weak var containerListView: UIView!
    @IBOutlet weak var containerMapView: UIView!
    
    var containerViewController: EventListViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
    }
    
    @IBAction func filterButtonTapped(_ sender: UIButton) {
        let vc = EventFilterViewController()
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
            containerViewController?.setupData()
            containerViewController?.configureTableView()
        case 1:
            self.containerMapView.isHidden = false
            self.containerListView.isHidden = true
        default:
            self.containerListView.isHidden = false
            self.containerMapView.isHidden = true
            containerViewController?.idSegment = 2
            containerViewController?.setupData()
            containerViewController?.configureTableView()
        }
        
    }
    
    
}

// MARK: UI Functions
extension HomeEventsViewController {
    
    func setupNavigationBar(){
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
        
    }
    
}

// MARK: Container View Segue
extension HomeEventsViewController {
    //Acessando os dados que estão dentro do viewcontroler, que estão dentro do Container View na home
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEventList" {
            containerViewController = segue.destination as? EventListViewController
        }
    }
    
}

// MARK: Navigation Bar Customization
extension HomeEventsViewController {
    
    @objc private func popToPrevious() {
        let rootViewController = UINavigationController(rootViewController: HomeViewController())
        self.view.window?.rootViewController = rootViewController
        navigationController?.popToRootViewController(animated: true)
    }
    
}

