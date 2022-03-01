//
//  TreinoIniciadoVC.swift
//  YogaZone
//
//  Created by Marcus on 28/02/22.
//
// pod 'Gifu', '~> 3.3.1'

import UIKit

class TreinoIniciadoVC: UIViewController {

    @IBOutlet weak var tappedArrowVoltar: UIImageView!
    
    @IBOutlet weak var titleExerciceNameLabel: UILabel!
    
    @IBOutlet weak var subtitleExerciceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configBackButton()
        tappedArrowVoltar.image = UIImage(named: "arrowVoltarCinza")
        
        
        // Hide Back Button from UINavigationItem
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    private func configBackButton(){
        let tapBackButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedBackButton))
        self.tappedArrowVoltar.addGestureRecognizer(tapBackButton)
        self.tappedArrowVoltar.isUserInteractionEnabled = true
        
    }
    
    @objc func tappedBackButton(){
        print("back button working!!!")
        // TODO -> Pause exercice and Open Modal asking if you want to leave givin 2 options - cotinue or leave
    }
}
