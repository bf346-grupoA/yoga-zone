import AVFoundation

class YogaPlayer {
    var player: AVAudioPlayer? = nil
    var filename: String
    var fileExtension: String
    
    init(filename: String, fileExtension: String) {
        self.filename = filename
        self.fileExtension = fileExtension
    }
    
    func setup() {
        guard let url = Bundle.main.url(forResource: self.filename, withExtension: self.fileExtension) else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            self.player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

        } catch let error {
            print(error.localizedDescription)
        }
    }

    func play() {
        guard let player = self.player else { return }
        player.play()
    }
    
    func stop() {
        guard let player = self.player else { return }
        player.stop()
    }
}

