import UIKit

protocol SliderEventsDelegate: AnyObject{
    
    func updateInhale(inhaleValue: Int)
    func updatoHold(holdValue: Int)
    func updateExpire(expire: Int)
    func updateCicle(cicle: Int)
}

class SettingsViewController: UIViewController {
 
    weak var delegate:SliderEventsDelegate?
    
    
    @IBOutlet weak var sliderInhale: UISlider!
    @IBOutlet weak var labelInhale: UILabel!
    @IBOutlet weak var labelSecondsIlhale: UILabel!
  
    @IBOutlet weak var sliderHold: UISlider!
    @IBOutlet weak var labelHold: UILabel!
    @IBOutlet weak var labelSecondsHold: UILabel!
    
    @IBOutlet weak var sliderExpire: UISlider!
    @IBOutlet weak var labelExpire: UILabel!
    @IBOutlet weak var labelSecondsExpire: UILabel!
    
    @IBOutlet weak var sliderCicle: UISlider!
    @IBOutlet weak var labelCicle: UILabel!
    @IBOutlet weak var labelSecondsCicle: UILabel!
    
    
    @IBOutlet weak var saveSettingsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backSaveSettingsButton(_ sender: Any) {
        
        self.navigationController? .pushViewController (BreathingHomeViewController(), animated: true)
    }
    
    @IBAction func onValueInhale(_ sender: Any) {

//        let viewModel = ViewModel.getViewModel()
////        viewModel.self.
        let xulambsInhale = self.sliderInhale.value * 30
//        print(String(format:"%0.0f", xulambs))
        
        labelSecondsIlhale.text = "\(String(format:"%0.0f", xulambsInhale)) segundos"
        
        
        delegate?.updateInhale(inhaleValue: Int((xulambsInhale)))
      
        
    }
    @IBAction func onValueHold(_ sender: Any) {
    
        let xulambsHold = self.sliderHold.value * 30
//        print(String(format:"%0.0f", xulambs))
        
        labelSecondsHold.text = "\(String(format:"%0.0f", xulambsHold)) segundos"
        
        
        delegate?.updatoHold(holdValue: Int((xulambsHold)))
    }
    
    @IBAction func onValueExpire(_ sender: Any) {
        
        let xulambsExpire = self.sliderExpire.value * 30
//        print(String(format:"%0.0f", xulambs))
        
        labelSecondsExpire.text = "\(String(format:"%0.0f", xulambsExpire)) segundos"
        
        
        delegate?.updateExpire(expire: Int((xulambsExpire)))
        
    }
    @IBAction func onValueCicle(_ sender: Any) {
        
        let xulambsCicle = self.sliderCicle.value * 10
//        print(String(format:"%0.0f", xulambs))
        
        labelSecondsCicle.text = "\(String(format:"%0.0f", xulambsCicle)) segundos"
        
        
        delegate?.updateCicle(cicle: Int((xulambsCicle)))
    }
    
}
