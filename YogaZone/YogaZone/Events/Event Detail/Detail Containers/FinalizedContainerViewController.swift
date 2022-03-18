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
        finalizedLabel.text = "Evento Finalizado"
    }
    
}

