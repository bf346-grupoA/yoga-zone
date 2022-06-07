//
//  TreinoPausadoVC.swift
//  YogaZone
//
//  Created by Marcus on 04/03/22.
//

import UIKit

class TrainingPausedVC: UIViewController {
    
    
    @IBOutlet weak var pausedLabel: UILabel!
    
    weak var delegate: TrainingStartedVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.returnToTrain()
    }
    
    
    private func returnToTrain(){
        let tapView = UITapGestureRecognizer(target: self, action: #selector(self.tappedView))
        self.view.addGestureRecognizer(tapView)
        self.view.isUserInteractionEnabled = true
       
    }
    
    @objc func tappedView(){
        self.delegate?.resumeTimer()
        presentingViewController?.dismiss(animated: false, completion: nil)
    }
}
