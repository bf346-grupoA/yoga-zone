import UIKit

// MARK: IBOutlets and Lifecycle
class PracticeViewController: UIViewController {
    var isPaused: Bool = false
    var selectedFile: MeditationAudioFile? = nil
    var player: YogaPlayer?
    
    @IBOutlet weak var practiceImageView: UIImageView!
    @IBOutlet weak var meditationState: UILabel!
    @IBOutlet weak var meditationFilename: UILabel!
    @IBOutlet var playButton: [UITapGestureRecognizer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupPlayer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.player?.stop()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.player = nil
    }
    
    @IBAction func onTap(_ sender: Any) {
        if isPaused {
            self.player?.play()
        } else {
            self.player?.stop()
        }
    }
    
    
}

// MARK: UI and Player setup
extension PracticeViewController {
    func setupUI() {
        self.practiceImageView.image = #imageLiteral(resourceName: "meditacao-musica")
        self.meditationState.text = self.isPaused ? "Em Pausa" : "Reproduzindo"
        self.meditationFilename.text = selectedFile?.title
    }
    
    func setupPlayer() {
        player = YogaPlayer(filename: selectedFile?.synthPad ?? "pad-B", fileExtension: "mp3")
        player?.setup()
        player?.play()
    }
}


// MARK: IBActions
extension PracticeViewController {
    
}
