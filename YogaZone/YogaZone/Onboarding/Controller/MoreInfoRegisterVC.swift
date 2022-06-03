//
//  MoreInfoRegisterVC.swift
//  YogaZone
//
//  Created by Marcus on 16/03/22.
//

import UIKit

class MoreInfoRegisterVC: UIViewController, UIGestureRecognizerDelegate {

    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var locateLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var womanLabel: UILabel!
    
    @IBOutlet weak var manLabel: UILabel!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var ufTextField: UITextField!
    
    @IBOutlet weak var btnWoman: UIButton!
    
    @IBOutlet weak var btnMan: UIButton!
    
    @IBOutlet weak var registerDoneBtn: UIButton!
    
    let radioController: RadioButtonController = RadioButtonController()
    	
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        createDatePicker()
        setupUI()
        setupRadioButton()
    }
    
    // MARK: DatePicker Implementation
    let datePicker = UIDatePicker()
    
    func createToolBar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        ageTextField.textAlignment = .center
        ageTextField.inputView = datePicker
        ageTextField.inputAccessoryView = createToolBar()
    }
    
    @objc func donePressed(){
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.timeStyle = .none
        
        self.ageTextField.text = dateFormater.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    // MARK: Radio Button
    func setupRadioButton(){
        radioController.buttonsArray = [btnWoman,btnMan]
        radioController.defaultButton = btnWoman
    }
    
    // MARK: SetupUI
    func configRegisterDoneButton(){
        var containerTitle = AttributeContainer()
            containerTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        
        var config = UIButton.Configuration.filled()
            config.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
            config.baseForegroundColor = .white
            config.attributedTitle = AttributedString("Avançar", attributes: containerTitle)
        
        self.registerDoneBtn.configuration = config
        self.registerDoneBtn.layer.cornerRadius = 8

    }
    
    func configLabels(){
        self.ageLabel.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.ageLabel.textAlignment = .center
        self.locateLabel.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.locateLabel.textAlignment = .center
        self.genderLabel.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.genderLabel.textAlignment = .center
        self.womanLabel.font = UIFont(name: "Comfortaa-Regular", size: 16)
        self.womanLabel.textAlignment = .center
        self.manLabel.font = UIFont(name: "Comfortaa-Regular", size: 16)
        self.manLabel.textAlignment = .center
    }
    
    func configTextFields(){
        self.ageTextField.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.cityTextField.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.ufTextField.font = UIFont(name: "Comfortaa-Bold", size: 16)
    }
    
    func setupUI(){
        configRegisterDoneButton()
        configLabels()
        configTextFields()
    }
    
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
    
    @IBAction func btnWomanAction(_ sender: UIButton) {
        radioController.buttonArrayUpdated(buttonSelected: sender)
    }
    
    @IBAction func btnManAction(_ sender: UIButton) {
        radioController.buttonArrayUpdated(buttonSelected: sender)
    }
    
    @IBAction func tappedRegisterDone(_ sender: UIButton) {
        self.navigationController?.pushViewController(DoneRegisterVC(), animated: true)
        UserDefaults.standard.set(true, forKey: "isOnboardingAvaliable")
    }
}

// MARK: Navigation Bar Customization
extension MoreInfoRegisterVC {
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
}
