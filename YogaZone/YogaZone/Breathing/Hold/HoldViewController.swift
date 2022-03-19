import AVKit
import Foundation
import UIKit

class HoldViewController: UIViewController {
    @IBOutlet weak var holdButton: UIButton!
    @IBOutlet weak var labelCicleHold: UILabel!
    @IBOutlet weak var labelSecondsHold: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
            
            let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "hold", ofType: "mp4")!))
            let layer = AVPlayerLayer(player: player)
            layer.frame = view.bounds
            view.layer.addSublayer(layer)
            
            player.play()
            
       
            }
    @IBAction func holdNextButton(_ sender: Any) {
        
        self.navigationController? .pushViewController (ExpireViewController(), animated: true)
        
    }
    
}
