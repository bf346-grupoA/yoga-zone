//
//  TreinoIniciadoVC.swift
//  YogaZone
//
//  Created by Marcus on 28/02/22.
//


import UIKit

class TrainingStartedVC: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var titleExerciceNameLabel: UILabel!
    
    @IBOutlet weak var subtitleExerciceLabel: UILabel!
    
    @IBOutlet weak var secondsTimerLabel: UILabel!
    
    @IBOutlet weak var pauseImage: UIImageView!
    
    @IBOutlet weak var nextImage: UIImageView!
    
    @IBOutlet weak var gifImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        self.configPauseButton()
        self.configNextButton()
        self.loadGifImage()
        self.setupImages()
    }
    
    func loadGifImage(){
        gifImage.image = UIImage.gifImageWithName("01_Natarajasana")
    }
    
    func setupImages(){
        pauseImage.image = UIImage(named: "pauseImage")
        nextImage.image = UIImage(named: "nextArrowImage")
    }
    
    private func configPauseButton(){
        let tapPauseButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedPauseButton))
        self.pauseImage.addGestureRecognizer(tapPauseButton)
        self.pauseImage.isUserInteractionEnabled = true
    }
    
    @objc func tappedPauseButton(){
        let vc = TrainingPausedVC()
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
        let vc = TrainingFinishedVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: Navigation Bar Customization
extension TrainingStartedVC {
    func setupNavigationBar(){
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "arrowVoltar"),
            style: .plain,
            target: self,
            action: #selector(leaveTraining)
        )
    }
    
    @objc private func leaveTraining() {
        let leaveTraining = LeaveTrainingVC()
        navigationController?.pushViewController(leaveTraining, animated: false)
    }
}
