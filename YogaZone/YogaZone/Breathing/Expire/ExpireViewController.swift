import AVKit
import Foundation
import UIKit

class ExpireViewController: UIViewController {

    @IBOutlet weak var timerTestButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
            
            let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "expire", ofType: "mp4")!))
            let layer = AVPlayerLayer(player: player)
            layer.frame = view.bounds
            view.layer.addSublayer(layer)
            
            player.play()
            
       
            }

    @IBAction func timerTestButtonLetsGo(_ sender: Any) {
        self.navigationController? .pushViewController (InhaleViewController(), animated: true)
        
    }
    
}
