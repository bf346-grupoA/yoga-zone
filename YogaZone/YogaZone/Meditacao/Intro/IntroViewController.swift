//
//  IntroViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 05/03/22.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onStart(_ sender: UIButton) {
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
}

extension IntroViewController {
    
}
