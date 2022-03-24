//
//  TreinoPausadoVC.swift
//  YogaZone
//
//  Created by Marcus on 04/03/22.
//

import UIKit

class TrainingPausedVC: UIViewController {

    @IBOutlet weak var pausedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ReturnToTrain()
    }
    
    private func ReturnToTrain(){
        let tapView = UITapGestureRecognizer(target: self, action: #selector(self.tappedView))
        self.view.addGestureRecognizer(tapView)
        self.view.isUserInteractionEnabled = true
        
    }
    
    @objc func tappedView(){
        presentingViewController?.dismiss(animated: false, completion: nil)
    }
}
