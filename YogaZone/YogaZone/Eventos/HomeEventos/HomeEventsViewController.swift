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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        containerMapView.isHidden = true
    }
    
    @IBAction func filterButtonTapped(_ sender: UIButton) {
        //let vc = FilterController()
        //present(vc, animated: true, completion: nil)
    }
    
    @IBAction func createEventButtonTapped(_ sender: UIButton) {
        let vc = CriarNovoEventoController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapSegment(segment: UISegmentedControl){
       switch segment.selectedSegmentIndex {
        case 0:
           containerListView.isHidden = false
           containerMapView.isHidden = true
        case 1:
           containerMapView.isHidden = false
           containerListView.isHidden = true
        default:
           containerListView.isHidden = false
           containerMapView.isHidden = true
        }

    }
    
}

// MARK: UI Functions
extension HomeEventsViewController {
    func setupUI(){
        navigationItem.title = "Eventos"
        buttonFilter.setTitle("Filtros", for: .normal)
        buttonCreateNewEvent.setTitle("Criar Novo Evento", for: .normal)
        optionsControl.setTitle("Lista", forSegmentAt: 0)
        optionsControl.setTitle("Mapa", forSegmentAt: 1)
        optionsControl.setTitle("Meus Eventos", forSegmentAt: 2)
    }
   
}
