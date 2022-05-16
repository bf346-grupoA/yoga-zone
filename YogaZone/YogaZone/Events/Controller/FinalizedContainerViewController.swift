//
//  FinalizedContainerViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 15/03/22.
//

import UIKit

class FinalizedContainerViewController:UIViewController {
    
    @IBOutlet weak var finalizedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()        
    }
    
}

// MARK: UI Functions
extension FinalizedContainerViewController {
    func setupUI(){
        self.finalizedLabel.text = "Evento Finalizado"
        self.finalizedLabel.textColor = #colorLiteral(red: 0.831372549, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
        self.finalizedLabel.backgroundColor = #colorLiteral(red: 0.7843137255, green: 0.7607843137, blue: 0.7607843137, alpha: 0.4031715646)
    }
    
}


