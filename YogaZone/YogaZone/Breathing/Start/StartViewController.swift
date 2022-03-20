import AVKit
import Foundation
import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
            
            let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "start", ofType: "mp4")!))
            let layer = AVPlayerLayer(player: player)
            layer.frame = view.bounds
            view.layer.addSublayer(layer)
            
            player.play()
            
       
            }
    
    @IBAction func nowStartButton(_ sender: Any) {

        self.navigationController? .pushViewController (InhaleViewController(), animated: true)

    }
    

        
    
}