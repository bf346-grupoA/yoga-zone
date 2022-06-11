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

protocol LeaveTrainingVCDelegate: AnyObject {
    func killTimer()
}

class TrainingStartedVC: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var titleExerciceNameLabel: UILabel!
    @IBOutlet weak var subtitleExerciceLabel: UILabel!
    @IBOutlet weak var secondsTimerLabel: UILabel!
    @IBOutlet weak var pauseImage: UIImageView!
    @IBOutlet weak var nextImage: UIImageView!
    @IBOutlet weak var gifImage: UIImageView!
    
    var exercicesData: [ExercicesModel] = []
    
    var timer = Timer()
    var seconds = 61
    var isTimerRunning = false
    var resumeTapped = false
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupNavigationBar()
        self.configPauseButton()
        self.configNextButton()
        self.loadGifImage()
        self.setupImages()
        self.configLabels()
        self.runTimer()
    }
    
    // MARK: Setup UI
    
    func configLabels(){
        self.titleExerciceNameLabel.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.titleExerciceNameLabel.textAlignment = .center
        self.titleExerciceNameLabel.text = self.exercicesData[0].exercise
    }
    
    func loadGifImage(){
        gifImage.image = UIImage.gifImageWithName(self.exercicesData[0].exercise ?? "")
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
        if let titleLbl = subtitleExerciceLabel.text {
            if titleLbl == "10 de 10"{
                timer.invalidate()
                let vc = TrainingFinishedVC()
                navigationController?.pushViewController(vc, animated: true)
            } else {
                timer.invalidate()
                seconds = 61
                updateTimer()
                runTimer()
                self.nextExercise()
            }
        }
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
        leaveTraining.delegate = self
        navigationController?.pushViewController(leaveTraining, animated: false)
    }
}

// MARK: Timer Configuration
extension TrainingStartedVC: TrainingStartedVCDelegate, LeaveTrainingVCDelegate {
    func killTimer() {
       timer.invalidate()
    }
    
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
            if self.seconds == 0 {
                self.tappedNextButton()
            }
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

// MARK: Exercice Called
extension TrainingStartedVC {
    func nextExercise(){
        switch titleExerciceNameLabel.text {
        case exercicesData[0].exercise:
            titleExerciceNameLabel.text = exercicesData[1].exercise
            gifImage.image = UIImage.gifImageWithName(self.exercicesData[1].exercise ?? "")
            subtitleExerciceLabel.text = "0"+String(exercicesData[1].id ?? 0)+" de 10"
        case exercicesData[1].exercise:
            titleExerciceNameLabel.text = exercicesData[2].exercise
            gifImage.image = UIImage.gifImageWithName(self.exercicesData[2].exercise ?? "")
            subtitleExerciceLabel.text = "0"+String(exercicesData[2].id ?? 0)+" de 10"
        case exercicesData[2].exercise:
            titleExerciceNameLabel.text = exercicesData[3].exercise
            gifImage.image = UIImage.gifImageWithName(self.exercicesData[3].exercise ?? "")
            subtitleExerciceLabel.text = "0"+String(exercicesData[3].id ?? 0)+" de 10"
        case exercicesData[3].exercise:
            titleExerciceNameLabel.text = exercicesData[4].exercise
            gifImage.image = UIImage.gifImageWithName(self.exercicesData[4].exercise ?? "")
            subtitleExerciceLabel.text = "0"+String(exercicesData[4].id ?? 0)+" de 10"
        case exercicesData[4].exercise:
            titleExerciceNameLabel.text = exercicesData[5].exercise
            gifImage.image = UIImage.gifImageWithName(self.exercicesData[5].exercise ?? "")
            subtitleExerciceLabel.text = "0"+String(exercicesData[5].id ?? 0)+" de 10"
        case exercicesData[5].exercise:
            titleExerciceNameLabel.text = exercicesData[6].exercise
            gifImage.image = UIImage.gifImageWithName(self.exercicesData[6].exercise ?? "")
            subtitleExerciceLabel.text = "0"+String(exercicesData[6].id ?? 0)+" de 10"
        case exercicesData[6].exercise:
            titleExerciceNameLabel.text = exercicesData[7].exercise
            gifImage.image = UIImage.gifImageWithName(self.exercicesData[7].exercise ?? "")
            subtitleExerciceLabel.text = "0"+String(exercicesData[7].id ?? 0)+" de 10"
        case exercicesData[7].exercise:
            titleExerciceNameLabel.text = exercicesData[8].exercise
            gifImage.image = UIImage.gifImageWithName(self.exercicesData[8].exercise ?? "")
            subtitleExerciceLabel.text = "0"+String(exercicesData[8].id ?? 0)+" de 10"
        case exercicesData[8].exercise:
            titleExerciceNameLabel.text = exercicesData[9].exercise
            gifImage.image = UIImage.gifImageWithName(self.exercicesData[9].exercise ?? "")
            subtitleExerciceLabel.text = String(exercicesData[9].id ?? 0)+" de 10"
        break
        default:
            titleExerciceNameLabel.text = "Exercicio"
            gifImage.image = UIImage.gifImageWithName(self.exercicesData[0].exercise ?? "")
            subtitleExerciceLabel.text = "0"+String(exercicesData[1].id ?? 0)+" de 10"
        }
    }
}

// MARK: Populate Data
extension TrainingStartedVC {
    func setupData() {
        let jsonData = trainingListMock.data(using: .utf8)
        do {
            let exercices = try JSONDecoder().decode([ExercicesModel].self, from: jsonData ?? Data() )
            exercices.forEach { self.exercicesData.append($0)}
        } catch {
            print(error)
        }
    }
}
