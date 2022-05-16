//
//  TreinoIniciadoVC.swift
//  YogaZone
//
//  Created by Marcus on 28/02/22.
//


import UIKit

protocol TrainingStartedVCDelegate:AnyObject {
    func resumeTimer()
}

<<<<<<< HEAD:YogaZone/YogaZone/Training/TrainingStarted/TrainingStartedVC.swift

=======
>>>>>>> 10cddc1f8300d5a71cb742cfbe03b635e28e6282:YogaZone/YogaZone/Training/Controller/TrainingStartedVC.swift
class TrainingStartedVC: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var titleExerciceNameLabel: UILabel!
    
    @IBOutlet weak var subtitleExerciceLabel: UILabel!
    
    @IBOutlet weak var secondsTimerLabel: UILabel!
    
    @IBOutlet weak var pauseImage: UIImageView!
    
    @IBOutlet weak var nextImage: UIImageView!
    
    @IBOutlet weak var gifImage: UIImageView!

    var timer = Timer()
    var seconds = 61
    var isTimerRunning = false
    var resumeTapped = false
    
    
    var timer = Timer()
    var seconds = 61
    var isTimerRunning = false
    var resumeTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        self.configPauseButton()
        self.configNextButton()
        self.loadGifImage()
        self.setupImages()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.runTimer()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.runTimer()
        
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
            vc.delegate = self
            vc.view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: false, completion: nil)
            self.pauseTimer()
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

// MARK: Timer Configuration
extension TrainingStartedVC: TrainingStartedVCDelegate {
    func resumeTimer() {
        self.pauseTimer()
    }
    
 
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TrainingStartedVC.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if self.seconds > 0 {
            seconds -= 1
            secondsTimerLabel.text = "\(seconds)"
        } else {
            self.seconds = 0
        }
    }
    
    func pauseTimer(){
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
            self.pauseImage.image = UIImage(named: "playButtonImage")
        } else {
            runTimer()
            self.resumeTapped = false
            self.pauseImage.image = UIImage(named: "pauseImage")
        }
    }
}
