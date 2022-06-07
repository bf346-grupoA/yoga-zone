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
    @IBOutlet weak var backBUtton: UIButton!
    
    let fireStore = Firestore.firestore()
    var viewModel = BmiViewModel()
    var heigth:Float = 1.4
    var weight:Float = 75
    var goal:Float = 0
    var bmi:Float = 0
    var missing: Float = 1.5
    
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
        self.navigationItem.setHidesBackButton(true, animated: true);
    }
    
    @IBAction func unwindToBmiVC(_ sender: UIStoryboardSegue) {
    }
    
    @IBAction func tappedBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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