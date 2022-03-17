import AVKit
import Foundation
import UIKit

class ExpireViewController: UIViewController {

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


}
