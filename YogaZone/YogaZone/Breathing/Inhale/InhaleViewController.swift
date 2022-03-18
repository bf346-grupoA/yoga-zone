import AVKit
import Foundation
import UIKit

class InhaleViewController: UIViewController {

//    @objc var counter:Int = 30
    var timer:Int = (0)
    var index:Int = (0)
  
    @IBOutlet weak var labelInhale: UILabel!
    @IBOutlet weak var inhaleButton: UIButton!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        contagemRegressiva()
        
//        labelInhale.text = " \(HomeViewController().viewModel.sliderInhale) Segundos"
 
        
        print(BreathingHomeViewController().viewModel.sliderExpire)
    }
   
    func startTimer() {
//        for index in 1...10 {
//            print(index) // prints 10 through 1
//            labelInhale.text = "\(Int(index)) segundos"
    }
    
    func contagemRegressiva() {
        for index in (1...10).reversed() {
            print(index) // prints 10 through 1
            labelInhale.text = "\(Int(index)) segundos"

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
        
//        print("Olá")
//
//        let vc = ModalViewController();present(vc, animated: true, completion: nil)
//
//        print("Olá 2")
//                                       }
    
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
}


