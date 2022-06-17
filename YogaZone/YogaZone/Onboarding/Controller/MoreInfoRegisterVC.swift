//
//  MoreInfoRegisterVC.swift
//  YogaZone
//
//  Created by Marcus on 16/03/22.
//

import FirebaseFirestore
import FirebaseAuth
import UIKit

class MoreInfoRegisterVC: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var locateLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var womanLabel: UILabel!
    
    @IBOutlet weak var manLabel: UILabel!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var stateTextField: UITextField!
    
    @IBOutlet weak var btnWoman: UIButton!
    
    @IBOutlet weak var btnMan: UIButton!
    
    @IBOutlet weak var registerDoneBtn: UIButton!
    
    let onboardingViewModel:OnboardingViewModel = OnboardingViewModel()
    let database = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configStatePickerView()
        configCityPickerView()
        createDatePicker()
        setupUI()
    }
    
    // MARK: UIPickers Implementation
    let datePicker = UIDatePicker()
    let statePickerView = UIPickerView()
    let cityPickerView = UIPickerView()
    
    func createToolBar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    
    func loadStateData(){
        self.onboardingViewModel.delegate(delegate: self)
        self.onboardingViewModel.getRequestBrazilianState()
    }
    
    func configStatePickerView(){
        self.statePickerView.delegate = self
        self.statePickerView.dataSource = self
        
        self.stateTextField.inputView = statePickerView
        self.stateTextField.textAlignment = .center
        self.stateTextField.inputAccessoryView = createToolBar()
        self.stateTextField.isEnabled = false
        self.stateTextField.isUserInteractionEnabled = false
    }
    
    func configCityPickerView(){
        self.cityPickerView.delegate = self
        self.cityPickerView.dataSource = self
        
        self.cityTextField.inputView = cityPickerView
        self.cityTextField.textAlignment = .center
        self.cityTextField.inputAccessoryView = createToolBar()
        self.cityTextField.isEnabled = false
        self.cityTextField.isUserInteractionEnabled = false
    }
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        
        ageTextField.textAlignment = .center
        ageTextField.inputView = datePicker
        ageTextField.inputAccessoryView = createToolBar()
    }
    
    @objc func donePressed(){
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .short
        dateFormater.locale = Locale.current
        self.ageTextField.text = dateFormater.string(from: self.datePicker.date)
        
        self.loadStateData()
        self.view.endEditing(true)
    }
            
    // MARK: SetupUI
    func configRegisterDoneButtonEnabled(){
        var containerTitle = AttributeContainer()
        containerTitle.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        config.baseForegroundColor = .white
        config.attributedTitle = AttributedString(OnboardingConstants.nextStep.rawValue, attributes: containerTitle)
        
        self.registerDoneBtn.configuration = config
        self.registerDoneBtn.layer.cornerRadius = 8
        self.registerDoneBtn.isEnabled = true
        
    }
    
    func configRegisterDoneButtonDisabled(){
        var containerTitle = AttributeContainer()
        containerTitle.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = #colorLiteral(red: 0.7843137255, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
        config.baseForegroundColor = .white
        config.attributedTitle = AttributedString(OnboardingConstants.nextStep.rawValue, attributes: containerTitle)
        
        self.registerDoneBtn.configuration = config
        self.registerDoneBtn.layer.cornerRadius = 8
        self.registerDoneBtn.isEnabled = false
        
    }
    
    func configLabels(){
        self.ageLabel.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.ageLabel.textAlignment = .center
        self.locateLabel.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.locateLabel.textAlignment = .center
    }
    
    func configTextFields(){
        self.ageTextField.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.ageTextField.placeholder = OnboardingConstants.informBirthDatePlaceholder.rawValue
        self.ageTextField.layer.cornerRadius = 6
        self.ageTextField.layer.borderWidth = 0.5
        self.ageTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        self.cityTextField.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.cityTextField.placeholder = OnboardingConstants.informCityPlaceholder.rawValue
        self.cityTextField.layer.cornerRadius = 6
        self.cityTextField.layer.borderWidth = 0.5
        self.cityTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.cityTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.cityTextField.minimumFontSize = 8
        self.cityTextField.sizeToFit()
        
        self.stateTextField.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.stateTextField.placeholder = OnboardingConstants.informStatePlaceholder.rawValue
        self.stateTextField.layer.cornerRadius = 6
        self.stateTextField.layer.borderWidth = 0.5
        self.stateTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.stateTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func setupUI(){
        configRegisterDoneButtonDisabled()
        configLabels()
        configTextFields()
    }
    
    func setupNavigationBar(){
        self.navigationItem.setHidesBackButton(false, animated: true)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4784313725, green: 0.4784313725, blue: 0.4784313725, alpha: 1)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: CommonConstants.backArrowImage.rawValue),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
    }
    
  @IBAction func tappedRegisterDone(_ sender: UIButton) {
        
        var userData = OnboardingModel()
        userData.email = Auth.auth().currentUser?.email
        userData.birthDate = self.datePicker.date
        userData.state = self.stateTextField.text
        userData.city = self.cityTextField.text
        userData.isOnboarding = false
        saveFirestoreData(user: userData)
        
        self.navigationController?.pushViewController(DoneRegisterVC(), animated: true)
    }
}

// MARK: Navigation Bar Customization
extension MoreInfoRegisterVC {
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - PickerView Delegate
extension MoreInfoRegisterVC: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == self.statePickerView {
            return self.onboardingViewModel.countTotalStates
        } else {
            return self.onboardingViewModel.countTotalCities
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == self.statePickerView {
            return self.onboardingViewModel.getLoadedStates(row: row)
        } else {
            return self.onboardingViewModel.getLoadedCities(row: row)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var state = ""
        
        if pickerView == self.statePickerView {
            state = self.onboardingViewModel.getLoadedStates(row: row)
            self.stateTextField.text = state
            self.cityTextField.text = ""
            if stateTextField.text != "" {
                self.cityTextField.isUserInteractionEnabled = true
                self.cityTextField.isEnabled = true
                self.cityTextField.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
                self.onboardingViewModel.getRequestBrazilianCity(state: state)
            }
        } else {
            cityTextField.text = self.onboardingViewModel.getLoadedCities(row: row)
        }
        
        if self.ageTextField.text != "" &&
            self.stateTextField.text != "" &&
            self.cityTextField.text != "" {
            configRegisterDoneButtonEnabled()
        } else {
            configRegisterDoneButtonDisabled()
        }
        
    }
    
}

//MARK: - ObboardingViewModel Delegate
extension MoreInfoRegisterVC: OnboardingViewModelDelegate {
    
    func error(error: Error) {
        DispatchQueue.main.async {
            let dialogMessage = UIAlertController(title: OnboardingConstants.atentionWarning.rawValue, message: OnboardingConstants.loadingRegionError.rawValue , preferredStyle: .alert)
            let ok = UIAlertAction(title: OnboardingConstants.ok.rawValue, style: .default, handler: { (action) -> Void in
            })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            print(error)
        }
        
    }
    
    func success(serviceType: serviceType) {
        
        if serviceType == .getState {
            DispatchQueue.main.async {
                self.stateTextField.isEnabled = true
                self.stateTextField.isUserInteractionEnabled = true
                self.stateTextField.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
            }
        }
        
    }
    
}

//MARK: - Firestore
extension MoreInfoRegisterVC {
    
    func saveFirestoreData(user:OnboardingModel) {
       
        if let email = Auth.auth().currentUser?.email,
           let birthDate = user.birthDate,
           let state = user.state,
           let city = user.city,
           let isOnboarding = user.isOnboarding {
            database.collection(CommonConstants.collectionName.rawValue)
                .document(email)
                .updateData([
                    OnboardingConstants.birthDateField.rawValue : birthDate,
                    OnboardingConstants.stateField.rawValue : state,
                    OnboardingConstants.cityField.rawValue : city,
                    OnboardingConstants.isOnboardingField.rawValue : isOnboarding
                ]) { (error) in
                    if let e = error {
                        print("\(CommonConstants.firestoreErrorSavingData.rawValue) \(e.localizedDescription)")
                    } else {
                        print(CommonConstants.firestoreDataSavedWithSuccess.rawValue)
                    }
                }
        }
    }
    
}
