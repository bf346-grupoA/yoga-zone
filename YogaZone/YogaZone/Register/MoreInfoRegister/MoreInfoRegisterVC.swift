//
//  MoreInfoRegisterVC.swift
//  YogaZone
//
//  Created by Marcus on 16/03/22.
//

import UIKit

class MoreInfoRegisterVC: UIViewController {

    @IBOutlet weak var tappedArrowVoltarImage: UIImageView!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var btnWoman: UIButton!
    
    @IBOutlet weak var btnMan: UIButton!
    
    
    let radioController: RadioButtonController = RadioButtonController()
    	
    override func viewDidLoad() {
        super.viewDidLoad()
        configImages()
        configBackButton()
        createDatePicker()
        
        radioController.buttonsArray = [btnWoman,btnMan]
        radioController.defaultButton = btnWoman
        
    }
    
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
    
    func configImages(){
            tappedArrowVoltarImage.image = UIImage(named: "arrowVoltarCinza")
        
            // Hide Back Button from UINavigationItem
                self.navigationItem.setHidesBackButton(true, animated: true)
        }
    
    private func configBackButton(){
        let tapBackButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedBackButton))
        self.tappedArrowVoltarImage.addGestureRecognizer(tapBackButton)
        self.tappedArrowVoltarImage.isUserInteractionEnabled = true
        
    }
    
    @objc func tappedBackButton(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnWomanAction(_ sender: UIButton) {
        radioController.buttonArrayUpdated(buttonSelected: sender)
    }
    
    @IBAction func btnManAction(_ sender: UIButton) {
        radioController.buttonArrayUpdated(buttonSelected: sender)
    }
    
    @IBAction func tappedRegisterDone(_ sender: UIButton) {
        self.navigationController?.pushViewController(DoneRegisterVC(), animated: true)
    }
    
}
