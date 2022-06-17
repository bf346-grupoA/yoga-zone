//
//  SairDoTreinoVC.swift
//  YogaZone
//
//  Created by Marcus on 05/03/22.
//

import UIKit


class LeaveTrainingVC: UIViewController {
    
    weak var delegate: LeaveTrainingVCDelegate?
    

    @IBOutlet weak var WantToLeaveLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func tappedYesButton(_ sender: UIButton) {
        self.delegate?.killTimer()
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    @IBAction func tappedNoButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
    }
}



    

