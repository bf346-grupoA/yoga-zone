//
//  HomeEventsViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 28/02/22.
//

import UIKit

class HomeEventsViewController: UIViewController{
    
    @IBOutlet weak var optionsControl: UISegmentedControl!
    @IBOutlet weak var buttonFilter: UIButton!
    @IBOutlet weak var buttonCreateNewEvent: UIButton!
    @IBOutlet weak var containerListView: UIView!
    @IBOutlet weak var containerMapView: UIView!
    
    var containerViewController: EventListViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        containerMapView.isHidden = true
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
            containerViewController?.idSegment = 0 //Aqui o 'prepare' acima é chamado e obtem acesso ao EventListViewController
            containerViewController?.setupData()
            containerViewController?.configureTableView()
        case 1:
            self.containerMapView.isHidden = false
            self.containerListView.isHidden = true
        default:
            self.containerListView.isHidden = false
            self.containerMapView.isHidden = true
            containerViewController?.idSegment = 2 //Aqui o 'prepare' acima é chamado e obtem acesso ao EventListViewController
            containerViewController?.setupData()
            containerViewController?.configureTableView()
        }
        
    }
    
    
}

// MARK: UI Functions
extension HomeEventsViewController {
    func setupUI(){
        
        
        self.buttonFilter.setImage(UIImage(named:"sliders-white"), for: .normal)
        self.buttonFilter.semanticContentAttribute = .forceLeftToRight
        
        self.buttonCreateNewEvent.setImage(UIImage(named:"circle-plus-white"), for: .normal)
        self.buttonCreateNewEvent.semanticContentAttribute = .forceLeftToRight
        
        self.buttonFilter.configuration?.imagePadding = 5
        self.buttonCreateNewEvent.configuration?.imagePadding = 5
        
        self.navigationItem.title = "Eventos"
        self.buttonFilter.setTitle("Filtros", for: .normal)
        self.buttonCreateNewEvent.setTitle("Criar Novo Evento", for: .normal)
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
