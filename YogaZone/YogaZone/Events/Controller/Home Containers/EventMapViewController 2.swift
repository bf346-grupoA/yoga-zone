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
        setupUI()
    }
    
}

// MARK: UI Functions
extension EventMapViewController {
    func setupUI(){
        self.noEventLabel.text =  "Nenhum evento selecionado"
        self.noEventLabel.layer.masksToBounds = true
        self.noEventLabel.layer.cornerRadius = 10
    }
    
}
