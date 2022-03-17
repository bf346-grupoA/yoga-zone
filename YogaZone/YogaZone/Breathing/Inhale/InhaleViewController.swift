import AVKit
import Foundation
import UIKit

class InhaleViewController: UIViewController {

    @objc var counter:Int = 30
    var timer = Timer()

    @IBOutlet weak var labelInhale: UILabel!
    @IBOutlet weak var inhaleButton: UIButton!
    @IBOutlet weak var startOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        
//        labelInhale.text = " \(HomeViewController().viewModel.sliderInhale) Segundos"
 
        
        print(HomeViewController().viewModel.sliderExpire)
    }
   
    func startTimer() {
        for _ in 1...10 {
             sleep(1)
            print("Beleza")

        }
        
    }

    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
            
            let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "inhale", ofType: "mp4")!))
            let layer = AVPlayerLayer(player: player)
            layer.frame = view.bounds
            view.layer.addSublayer(layer)
            
            player.play()
            
        
            }
    
        
        
    @IBAction func inhaleNextButton(_ sender: Any) {
        self.navigationController? .pushViewController (HoldViewController(), animated: true)
        

    }
    
    func delay(seconds: Int) async {
//        await Task.Task.sleep(nanoseconds: UInt64(seconds * Double(NSEC_PER_SEC)))
        do{
            try await Task.sleep(nanoseconds: 1)

        } catch{
            print("Vazio")
        }
        
    }
    
//    @IBAction func startInhaleButton(_ sender: AnyObject) {
//
//        }
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector( getter: InhaleViewController.counter), userInfo: nil, repeats: true)
//    }
//        func counterInhale(){
//
//        counter -= 1
//            labelInhale.text = String(counter)
//
//            if counter == 0{
//                timer.invalidate()
//            }
//    }
    
}


