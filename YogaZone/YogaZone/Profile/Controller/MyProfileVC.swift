//
//  MeuPerfilVC.swift
//  YogaZone
//
//  Created by Marcus on 07/03/22.
//



import FirebaseFirestore
import FirebaseAuth
import UIKit

class MyProfileVC: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var perfilImage: UIImageView!
    @IBOutlet weak var tappedCameraIconImage: UIImageView!
    @IBOutlet weak var tappedMoreOptionsButtonImage: UIImageView!
    @IBOutlet weak var saveChangesButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var editNameImage: UIImageView!
    @IBOutlet weak var editBirthdayImage: UIImageView!
    @IBOutlet weak var editStateImage: UIImageView!
    @IBOutlet weak var editCityImage: UIImageView!
    
    let profileViewModel:ProfileViewModel = ProfileViewModel()
    let database = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configImages()
        self.configMoreOptionsButton()
        self.configEditTextFieldButton()
        self.setupNavigationBar()
        self.configStatePickerView()
        self.configCityPickerView()
        self.createDatePicker()
        self.loadFirestoreUserData()
        self.configSaveButtonDisabled()
        self.configTextFields()
    }
    
    // MARK: UIPickers Implementation
    let datePicker = UIDatePicker()
    let statePickerView = UIPickerView()
    let cityPickerView = UIPickerView()
    
    func loadStateData(){
        self.profileViewModel.delegate(delegate: self)
        self.profileViewModel.getRequestBrazilianState()
    }
    
}

//MARK: - UISetup
extension MyProfileVC {
    
        func createToolBar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
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
        
        birthdayTextField.textAlignment = .center
        birthdayTextField.inputView = datePicker
        birthdayTextField.inputAccessoryView = createToolBar()
    }
    
    func configImages(){
        tappedMoreOptionsButtonImage.image = UIImage(named: "moreOptions")
        perfilImage.image = UIImage(named: "person")
        tappedCameraIconImage.image = UIImage(named: "cameraIcon")
    }
    
    // MARK: SetupUI
    func configSaveButtonEnabled(){
        var containerTitle = AttributeContainer()
        containerTitle.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        config.baseForegroundColor = .white
        config.attributedTitle = AttributedString(ProfileConstants.save.rawValue, attributes: containerTitle)
        
        self.saveChangesButton.configuration = config
        self.saveChangesButton.layer.cornerRadius = 8
        self.saveChangesButton.isEnabled = true
        
    }
    
    func configSaveButtonDisabled(){
        var containerTitle = AttributeContainer()
        containerTitle.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = #colorLiteral(red: 0.7843137255, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
        config.baseForegroundColor = .white
        config.attributedTitle = AttributedString(ProfileConstants.save.rawValue, attributes: containerTitle)
        
        self.saveChangesButton.configuration = config
        self.saveChangesButton.layer.cornerRadius = 8
        self.saveChangesButton.isEnabled = false
        
    }
    
    func configTextFields(){
        self.nameTextField.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.nameTextField.placeholder = ProfileConstants.informNamePlaceholder.rawValue
        self.nameTextField.layer.cornerRadius = 6
        self.nameTextField.layer.borderWidth = 0.5
        self.nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.nameTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.nameTextField.minimumFontSize = 8
        self.nameTextField.sizeToFit()
        self.nameTextField.textAlignment = .left
        self.nameTextField.isEnabled = false
        self.nameTextField.isUserInteractionEnabled = false
        
        self.birthdayTextField.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.birthdayTextField.placeholder = ProfileConstants.informBirthDatePlaceholder.rawValue
        self.birthdayTextField.layer.cornerRadius = 6
        self.birthdayTextField.layer.borderWidth = 0.5
        self.birthdayTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.birthdayTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.birthdayTextField.textAlignment = .left
        self.birthdayTextField.isEnabled = false
        self.birthdayTextField.isUserInteractionEnabled = false
        
        self.cityTextField.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.cityTextField.placeholder = ProfileConstants.informCityPlaceholder.rawValue
        self.cityTextField.layer.cornerRadius = 6
        self.cityTextField.layer.borderWidth = 0.5
        self.cityTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.cityTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.cityTextField.textAlignment = .left
        self.cityTextField.minimumFontSize = 8
        self.cityTextField.sizeToFit()
        
        self.stateTextField.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.stateTextField.placeholder = ProfileConstants.informStatePlaceholder.rawValue
        self.stateTextField.layer.cornerRadius = 6
        self.stateTextField.layer.borderWidth = 0.5
        self.stateTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.stateTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.stateTextField.textAlignment = .left
        
        self.nameTextField.delegate = self
        self.birthdayTextField.delegate = self
        self.stateTextField.delegate = self
        self.cityTextField.delegate = self
    }
    
    private func configMoreOptionsButton(){
        let tapMoreOptionsButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedMoreOptionsButton))
        self.tappedMoreOptionsButtonImage.addGestureRecognizer(tapMoreOptionsButton)
        self.tappedMoreOptionsButtonImage.isUserInteractionEnabled = true
    }
    
    private func configEditTextFieldButton(){
        let editName = UITapGestureRecognizer(target: self, action: #selector(self.tappedEditNameImage))
        self.editNameImage.addGestureRecognizer(editName)
        self.editNameImage.isUserInteractionEnabled = true
        
        let birthday = UITapGestureRecognizer(target: self, action: #selector(self.tappedEditBirthdayImage))
        self.editBirthdayImage.addGestureRecognizer(birthday)
        self.editBirthdayImage.isUserInteractionEnabled = true
        
        let state = UITapGestureRecognizer(target: self, action: #selector(self.tappedEditStateImage))
        self.editStateImage.addGestureRecognizer(state)
        self.editStateImage.isUserInteractionEnabled = true
        
        let city = UITapGestureRecognizer(target: self, action: #selector(self.tappedEditCityImage))
        self.editCityImage.addGestureRecognizer(city)
        self.editCityImage.isUserInteractionEnabled = true
    }
}

//MARK: - Actions
extension MyProfileVC {
    
    @IBAction func tappedSaveChangesButton(_ sender: UIButton) {
        var userData = ProfileModel()
        userData.name = self.nameTextField.text
        userData.birthDate = self.datePicker.date
        userData.state = self.stateTextField.text
        userData.city = self.cityTextField.text
        saveFirestoreData(user: userData)
        CustomAlertVC.instance.showAlert(titleType: .success, message: "Suas alterações foram salvas com sucesso !", alertType: .success)
        CustomAlertVC.instance.delegate(delegate: self)
    }
    
    @objc func tappedMoreOptionsButton(){
        self.navigationController?.pushViewController(MoreOptionsVC(), animated: true)
    }
    
    @objc func donePressed(){
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .short
        dateFormater.locale = Locale.current
        self.birthdayTextField.text = dateFormater.string(from: self.datePicker.date)
        
        self.view.endEditing(true)
    }
    
    @objc func tappedEditNameImage(){
        self.nameTextField.isEnabled = true
        self.nameTextField.isUserInteractionEnabled = true
        self.nameTextField.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
    }
    
    @objc func tappedEditBirthdayImage(){
        self.birthdayTextField.isEnabled = true
        self.birthdayTextField.isUserInteractionEnabled = true
        self.birthdayTextField.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
    }
    
    @objc func tappedEditStateImage(){
        self.stateTextField.isEnabled = true
        self.stateTextField.isUserInteractionEnabled = true
        self.stateTextField.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        loadStateData()
    }
    
    @objc func tappedEditCityImage(){
        self.cityTextField.isEnabled = true
        self.cityTextField.isUserInteractionEnabled = true
        self.cityTextField.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        self.profileViewModel.getRequestBrazilianCity(state: self.stateTextField.text ?? "")
    }
}

// MARK: Navigation Bar Customization
extension MyProfileVC {
    func setupNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Meu Perfil"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 24) ?? UIFont()]
        
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


//MARK: - CustomAlertDelegate
extension MyProfileVC: customAlertDelegate {
    
    func okPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - PickerView Delegate
extension MyProfileVC: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == self.statePickerView {
            return self.profileViewModel.countTotalStates
        } else {
            return self.profileViewModel.countTotalCities
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == self.statePickerView {
            return self.profileViewModel.getLoadedStates(row: row)
        } else {
            return self.profileViewModel.getLoadedCities(row: row)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var state = ""
        
        if pickerView == self.statePickerView {
            state = self.profileViewModel.getLoadedStates(row: row)
            self.stateTextField.text = state
            self.cityTextField.text = ""
            if stateTextField.text != "" {
                self.cityTextField.isUserInteractionEnabled = true
                self.cityTextField.isEnabled = true
                self.cityTextField.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
                self.profileViewModel.getRequestBrazilianCity(state: state)
            }
        } else {
            cityTextField.text = self.profileViewModel.getLoadedCities(row: row)
        }
        
        if  self.nameTextField.text != "" &&
                self.birthdayTextField.text != "" &&
                self.stateTextField.text != "" &&
                self.cityTextField.text != "" {
            configSaveButtonEnabled()
        } else {
            configSaveButtonDisabled()
        }
    }
}

//MARK: - ProfileViewModel Delegate
extension MyProfileVC: ProfileViewModelDelegate {
    func success(serviceType: ServiceType) {
        if serviceType == .getState {
            DispatchQueue.main.async {
                self.stateTextField.isEnabled = true
                self.stateTextField.isUserInteractionEnabled = true
                self.stateTextField.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
            }
        }
    }
    
    func error(error: Error) {
        DispatchQueue.main.async {
            let dialogMessage = UIAlertController(title: ProfileConstants.atentionWarning.rawValue, message: ProfileConstants.loadingRegionError.rawValue , preferredStyle: .alert)
            let ok = UIAlertAction(title: ProfileConstants.ok.rawValue, style: .default, handler: { (action) -> Void in
            })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            print(error)
        }
    }
}



//MARK: - Firestore
extension MyProfileVC {
    
    func saveFirestoreData(user:ProfileModel) {
        if let email = Auth.auth().currentUser?.email,
           let name = user.name,
           let birthDate = user.birthDate,
           let state = user.state,
           let city = user.city {
            database.collection(CommonConstants.collectionName.rawValue)
                .document(email)
                .updateData([
                    ProfileConstants.nameField.rawValue : name,
                    ProfileConstants.birthDateField.rawValue : birthDate,
                    ProfileConstants.stateField.rawValue : state,
                    ProfileConstants.cityField.rawValue : city,
                    
                ]) { (error) in
                    if let e = error {
                        print("\(CommonConstants.firestoreErrorSavingData.rawValue) \(e.localizedDescription)")
                    } else {
                        print(CommonConstants.firestoreDataSavedWithSuccess.rawValue)
                    }
                }
        }
    }
    
    func loadFirestoreUserData() {
        if let email = Auth.auth().currentUser?.email {
            database.collection(CommonConstants.collectionName.rawValue)
                .document(email)
                .getDocument { document, error in
                    if let e = error {
                        print("\(CommonConstants.firestoreRetrivingDataError.rawValue) \(e.localizedDescription)")
                    } else {
                        DispatchQueue.main.async {
                            if let document = document, document.exists {
                                let data = document.data()
                                let name = data?[ProfileConstants.nameField.rawValue] as? String ?? ""
                                let birth = data?[ProfileConstants.birthDateField.rawValue] as? Timestamp
                                let state = data?[ProfileConstants.stateField.rawValue] as? String ?? ""
                                let city = data?[ProfileConstants.cityField.rawValue] as? String ?? ""
                               
                                guard let birth = birth?.dateValue() else {return}
                                let formater = DateFormatter()
                                formater.dateStyle = .short
                                formater.locale = Locale.current
                                self.datePicker.date = birth
                                let formatedBirthDate = formater.string(from: birth)
                                
                                self.nameTextField.text = name
                                self.birthdayTextField.text = formatedBirthDate
                                self.stateTextField.text = state
                                self.cityTextField.text = city
                                
                            } else {
                                print("\(CommonConstants.firestoreDocumentDoesNotExistError.rawValue)")
                                
                            }
                        }
                    }
                }
        }
        
    }
    
}

// MARK: Input Fields Delegate
extension MyProfileVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case self.nameTextField:
            if self.nameTextField.text == ""{
                setRedBorder(textField: textField)
            }else{
                setNormalBorder(textField: textField)
            }
        case self.cityTextField:
            if self.cityTextField.text == ""{
                setRedBorder(textField: textField)
            }else{
                setNormalBorder(textField: textField)
            }
            
        default:
            break
        }
        
        if  self.nameTextField.text != "" &&
                self.birthdayTextField.text != "" &&
                self.stateTextField.text != "" &&
                self.cityTextField.text != "" {
            configSaveButtonEnabled()
        } else {
            configSaveButtonDisabled()
        }
        
    }
    
    func setRedBorder(textField: UITextField){
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1.0
    }
    
    func setNormalBorder(textField: UITextField){
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
