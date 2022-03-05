//
//  EventMapViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 28/02/22.
//

import UIKit

class EventMapViewController: UIViewController {
    
    @IBOutlet weak var noEventLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    
    
}

// MARK: UI Functions
extension EventMapViewController {
    func setupUI(){
        noEventLabel.text =  "Nenhum evento selecionado"
        noEventLabel.layer.masksToBounds = true
        noEventLabel.layer.cornerRadius = 10
    }
    
}
