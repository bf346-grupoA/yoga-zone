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
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldCity: UITextField!
    @IBOutlet weak var textFieldState: UITextField!
    @IBOutlet weak var textFieldBirthday: UITextField!
    
    let profileViewModel:ProfileViewModel = ProfileViewModel()
    let database = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configImages()
        self.configMoreOptionsButton()
        self.setupNavigationBar()
        self.configStatePickerView()
        self.configCityPickerView()
        self.createDatePicker()
        self.loadFirestoreUserData()
        self.setupUI()
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
        self.profileViewModel.delegate(delegate: self)
        self.profileViewModel.getRequestBrazilianState()
    }
    
    func configStatePickerView(){
        self.statePickerView.delegate = self
        self.statePickerView.dataSource = self
        
        self.textFieldState.inputView = statePickerView
        self.textFieldState.textAlignment = .center
        self.textFieldState.inputAccessoryView = createToolBar()
        self.textFieldState.isEnabled = false
        self.textFieldState.isUserInteractionEnabled = false
    }
    
    func configCityPickerView(){
        self.cityPickerView.delegate = self
        self.cityPickerView.dataSource = self
        
        self.textFieldCity.inputView = cityPickerView
        self.textFieldCity.textAlignment = .center
        self.textFieldCity.inputAccessoryView = createToolBar()
        self.textFieldCity.isEnabled = false
        self.textFieldCity.isUserInteractionEnabled = false
    }
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        
        textFieldBirthday.textAlignment = .center
        textFieldBirthday.inputView = datePicker
        textFieldBirthday.inputAccessoryView = createToolBar()
    }
    
    @objc func donePressed(){
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.timeStyle = .none
        self.textFieldBirthday.text = dateFormater.string(from: self.datePicker.date)
        
        self.loadStateData()
        self.view.endEditing(true)
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
        self.textFieldName.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.textFieldName.layer.cornerRadius = 6
        self.textFieldName.layer.borderWidth = 0.5
        self.textFieldName.layer.borderColor = UIColor.lightGray.cgColor
        self.textFieldName.minimumFontSize = 8
        self.textFieldName.sizeToFit()
        self.textFieldName.textAlignment = .left
        
        self.textFieldBirthday.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.textFieldBirthday.placeholder = ProfileConstants.informBirthDatePlaceholder.rawValue
        self.textFieldBirthday.layer.cornerRadius = 6
        self.textFieldBirthday.layer.borderWidth = 0.5
        self.textFieldBirthday.layer.borderColor = UIColor.lightGray.cgColor
        self.textFieldBirthday.textAlignment = .left
        
        self.textFieldCity.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.textFieldCity.placeholder = ProfileConstants.informCityPlaceholder.rawValue
        self.textFieldCity.layer.cornerRadius = 6
        self.textFieldCity.layer.borderWidth = 0.5
        self.textFieldCity.layer.borderColor = UIColor.lightGray.cgColor
        self.textFieldCity.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.textFieldCity.textAlignment = .left
        self.textFieldCity.minimumFontSize = 8
        self.textFieldCity.sizeToFit()
        
        
        self.textFieldState.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.textFieldState.placeholder = ProfileConstants.informStatePlaceholder.rawValue
        self.textFieldState.layer.cornerRadius = 6
        self.textFieldState.layer.borderWidth = 0.5
        self.textFieldState.layer.borderColor = UIColor.lightGray.cgColor
        self.textFieldState.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.textFieldState.textAlignment = .left
        
    }
    
    func setupUI(){
        configSaveButtonDisabled()
        configTextFields()
    }
    
    
    private func configMoreOptionsButton(){
        let tapMoreOptionsButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedMoreOptionsButton))
        self.tappedMoreOptionsButtonImage.addGestureRecognizer(tapMoreOptionsButton)
        self.tappedMoreOptionsButtonImage.isUserInteractionEnabled = true
    }
    
    @objc func tappedMoreOptionsButton(){
        self.navigationController?.pushViewController(MoreOptionsVC(), animated: true)
        
    }
    
    @IBAction func tappedSaveChangesButton(_ sender: UIButton) {
        var userData = ProfileModel()
        userData.name = self.textFieldName.text
        userData.birthDate = self.datePicker.date
        userData.state = self.textFieldState.text
        userData.city = self.textFieldCity.text
        saveFirestoreData(user: userData)
        CustomAlertVC.instance.showAlert(titleType: .success, message: "Suas alterações foram salvas com sucesso !", alertType: .success)
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
            self.textFieldState.text = state
            self.textFieldCity.text = ""
            if textFieldState.text != "" {
                self.textFieldCity.isUserInteractionEnabled = true
                self.textFieldCity.isEnabled = true
                self.textFieldCity.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
                self.profileViewModel.getRequestBrazilianCity(state: state)
            }
        } else {
            textFieldCity.text = self.profileViewModel.getLoadedCities(row: row)
        }
        
        if self.textFieldBirthday.text != "" &&
            self.textFieldState.text != "" &&
            self.textFieldCity.text != "" {
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
                self.textFieldState.isEnabled = true
                self.textFieldState.isUserInteractionEnabled = true
                self.textFieldState.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
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
                                let birthDate = data?[ProfileConstants.birthDateField.rawValue] as? Date ?? Date()
                                let state = data?[ProfileConstants.stateField.rawValue] as? String ?? ""
                                let city = data?[ProfileConstants.cityField.rawValue] as? String ?? ""
                                
                                let formater = DateFormatter()
                                formater.dateStyle = .short
                                formater.locale = Locale.current
                                let date = formater.string(from: birthDate)
                                
                                self.textFieldName.text = name
                                self.textFieldBirthday.text = date
                                self.textFieldState.text = state
                                self.textFieldCity.text = city
                
                            } else {
                                print("\(CommonConstants.firestoreDocumentDoesNotExistError.rawValue)")
                                
                            }
                        }
                    }
                }
        }
        
    }
    
}


