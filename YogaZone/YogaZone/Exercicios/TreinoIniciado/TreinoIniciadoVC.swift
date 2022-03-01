//
//  TreinoIniciadoVC.swift
//  YogaZone
//
//  Created by Marcus on 28/02/22.
//


import UIKit
import Gifu

class TreinoIniciadoVC: UIViewController {

    @IBOutlet weak var tappedArrowVoltar: UIImageView!
    
    @IBOutlet weak var titleExerciceNameLabel: UILabel!
    
    @IBOutlet weak var subtitleExerciceLabel: UILabel!
    
    @IBOutlet weak var gifExercice: GIFImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayGif()
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
    
    private func displayGif(){
        gifExercice.animate(withGIFNamed: "01_Natarajasana")
    }
}
