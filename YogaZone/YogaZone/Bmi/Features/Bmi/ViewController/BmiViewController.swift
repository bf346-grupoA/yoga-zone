//
//  ViewController.swift
//  BmiX
//
//  Created by Marcelo Silva on 22/04/22.
//

import UIKit
import FirebaseFirestore


protocol SendData {
    var result: Double {get}
    var weigth: String {get}
    var goal: String {get}
    var missing: String {get}
}

class BmiViewController: UIViewController {

    @IBOutlet weak var wLabel: UILabel!
    @IBOutlet weak var hLabel: UILabel!
    @IBOutlet weak var gLabel: UILabel!
    @IBOutlet weak var buttonCalculate: UIButton!
    @IBOutlet weak var buttonMyProgress: UIButton!
    @IBOutlet weak var sliderGoal: UISlider!
    @IBOutlet weak var switchLabel: UISwitch!
    
    let fireStore = Firestore.firestore()
    var viewModel = BmiViewModel()
    var heigth:Float = 1.4
    var weight:Float = 75
    var goal:Float = 1.3
    var bmi:Float = 0
    var getWeight:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.switchLabel.isOn = false
        self.viewModel.initFireStore()
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.buttonCalculate.layer.cornerRadius = 7
        self.buttonMyProgress.layer.cornerRadius = 7
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.blockSlider()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func sliderWeight(_ sender: Any) {
        weight = (sender as AnyObject).value
        let stringWeight = String(format: " %.1f", weight)
        wLabel.text = "\(stringWeight) Kg"
        viewModel.getWeight = stringWeight
        
    }
    
    @IBAction func sliderHeight(_ sender: Any) {
        heigth = (sender as AnyObject).value
        hLabel.text = String(format: " %.2f M", heigth)
    }
    
    @IBAction func sliderGoal(_ sender: Any) {
        goal = (sender as AnyObject).value
        let stringWeight = String(format: " %.1f", goal)
        gLabel.text = "\(stringWeight) Kg"
        viewModel.saveGoal = stringWeight
    }
    
    @IBAction func tappedCalculate(_ sender: Any) {
        self.calculateResult()
        self.viewModel.saveData()
    }
    
    @IBAction func switchTapped(_ sender: Any) {
        self.blockSlider()
    }
    
    @IBAction func tappedMyProgress(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyProgressViewController") as? MyProgressViewController
        vc?.weigth = String(format: " %.1f ", weight)
        vc?.goal = String(format: " %.1f ", goal)
        let missing = weight - goal
        vc?.missing = String(format: " %.1f ", missing)
        self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func unwindToOne(_ sender: UIStoryboardSegue) {
    }
}

extension BmiViewController {
    
    func calculateResult() {
        
        let result = weight / (heigth * heigth)
        self.viewModel.result = String(format: " %.1f ", result)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController
        vc?.result = Double(result)
        vc?.weigth = String(format: " %.1f ", weight)
        vc?.goal = String(format: " %.1f ", goal)
        vc?.missing = String(format: " %.1f ", weight - goal)
        self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    func blockSlider(){
        if switchLabel.isOn == true {
            sliderGoal.alpha = 0.3
            sliderGoal.isEnabled = false
        } else {
            sliderGoal.alpha = 1.0
            sliderGoal.isEnabled = true
        }
    }
    
}

// MARK: Navigation Bar Customization
extension BmiViewController: UIGestureRecognizerDelegate {
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4784313725, green: 0.4784313725, blue: 0.4784313725, alpha: 1)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "arrowVoltar"),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
    }
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
}
