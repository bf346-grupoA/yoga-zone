//
//  TreinoIniciadoVC.swift
//  YogaZone
//
//  Created by Marcus on 28/02/22.
//


import UIKit

class TreinoIniciadoVC: UIViewController {

    @IBOutlet weak var tappedArrowVoltar: UIImageView!
    
    @IBOutlet weak var titleExerciceNameLabel: UILabel!
    
    @IBOutlet weak var subtitleExerciceLabel: UILabel!
    
    @IBOutlet weak var secondsTimerLabel: UILabel!
    
    @IBOutlet weak var pauseImage: UIImageView!
    
    @IBOutlet weak var nextImage: UIImageView!
    
    @IBOutlet weak var gifImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configBackButton()
        self.configPauseButton()
        self.configNextButton()
        self.loadGifImage()
        
        tappedArrowVoltar.image = UIImage(named: "arrowVoltarCinza")
        pauseImage.image = UIImage(named: "pauseImage")
        nextImage.image = UIImage(named: "nextArrowImage")
        
        
        // Hide Back Button from UINavigationItem
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func loadGifImage(){
        gifImage.image = UIImage.gifImageWithName("01_Natarajasana")
    }
 
    private func configBackButton(){
        let tapBackButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedBackButton))
        self.tappedArrowVoltar.addGestureRecognizer(tapBackButton)
        self.tappedArrowVoltar.isUserInteractionEnabled = true
    }
    
    @objc func tappedBackButton(){
        let vcSairDoTreino = SairDoTreinoVC()
        navigationController?.pushViewController(vcSairDoTreino, animated: false)
    }
    
    private func configPauseButton(){
        let tapPauseButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedPauseButton))
        self.pauseImage.addGestureRecognizer(tapPauseButton)
        self.pauseImage.isUserInteractionEnabled = true
    }
    
    @objc func tappedPauseButton(){
        let vc = TreinoPausadoVC()
        vc.view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false, completion: nil)
    }
    
    private func configNextButton(){
        let tapNextButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedNextButton))
        self.nextImage.addGestureRecognizer(tapNextButton)
        self.nextImage.isUserInteractionEnabled = true
        
    }
    
    @objc func tappedNextButton(){
        let vc = TreinoFinalizadoVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
