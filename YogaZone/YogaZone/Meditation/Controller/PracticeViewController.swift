import UIKit

// MARK: IBOutlets and Lifecycle
class PracticeViewController: UIViewController {
    var isPaused: Bool = true
    var selectedFile: MeditationAudioFile? = nil
    var player: YogaPlayer?
    
    @IBOutlet weak var buttonImageView: UIImageView!
    @IBOutlet weak var practiceImageView: UIImageView!
    @IBOutlet weak var meditationState: UILabel!
    @IBOutlet weak var meditationFilename: UILabel!
    @IBOutlet var playButton: [UITapGestureRecognizer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupPlayer()
        setupNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.player?.stop()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.player = nil
    }
    
    @IBAction func onTap(_ sender: Any) {
        if isPaused {
            self.buttonImageView.image = #imageLiteral(resourceName: "meditacao-pause-button")
            self.player?.play()
        } else {
            self.buttonImageView.image = #imageLiteral(resourceName: "meditacao-play-button")
            self.player?.stop()
        }
        
        self.isPaused = !self.isPaused
        self.setUIState()
    }
    
    
}

// MARK: UI and Player setup
extension PracticeViewController {
    func setupUI() {
        self.practiceImageView.image = #imageLiteral(resourceName: "meditacao-musica")
        self.meditationFilename.text = selectedFile?.title
        self.setUIState()
    }
    
    func setUIState() {
        self.buttonImageView.image = self.isPaused ? #imageLiteral(resourceName: "meditacao-play-button") : #imageLiteral(resourceName: "meditacao-pause-button")
        self.meditationState.text = self.isPaused ? "Em Pausa" : "Reproduzindo"
    }
    
    func setupPlayer() {
        player = YogaPlayer(filename: selectedFile?.synthPad ?? "pad-B", fileExtension: "mp3")
        player?.setup()
    }
    
}


// MARK: IBActions
extension PracticeViewController {
    
}

// MARK: Navigation Bar Customization
extension PracticeViewController: UIGestureRecognizerDelegate {
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4784313725, green: 0.4784313725, blue: 0.4784313725, alpha: 1)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "arrowVoltar"),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
    }
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
}

