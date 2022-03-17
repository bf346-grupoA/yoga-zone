import UIKit
    
class HomeViewController: UIViewController, SliderEventsDelegate {
    func updateExpire(expire: Int) {
        self.viewModel.sliderExpire =
        Int(expire)
    print(expire)
    }
    
    func updateInhale(inhaleValue: Int) {
        self.viewModel.sliderInhale = Int(inhaleValue)
    print(inhaleValue)
    }
    
    func updatoHold(holdValue: Int) {
        self.viewModel.sliderHold =
        Int(holdValue)
    print(holdValue)
        
    }

    func updateCicle(cicle: Int) {
        self.viewModel.sliderCicle =
        Int(cicle)
    print(cicle)
        
    }

    public  var viewModel: ViewModel = ViewModel(sliderInhale: 1, sliderHold: 0, sliderExpire: 10, sliderCicle: 0)

    
    @IBOutlet weak var startExerciseButton: UIButton!
    @IBOutlet weak var settingsExerciseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func startNowExerciseButton(_ sender: Any) {
        self.navigationController? .pushViewController (StartViewController(), animated: true)
        
    }
    
    @IBAction func settingsExerciseButton(_ sender: Any) {
       
        viewModel.sliderExpire = 9
//        ViewModel.sliderInhale = 5
        
        
       let vc = SettingsViewController()
        vc.delegate=self
        
        self.navigationController? .pushViewController(vc, animated: true)
    }
    
}
