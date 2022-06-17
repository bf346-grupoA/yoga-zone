//
//  EventFilterViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 05/03/22.
//

protocol EventFilterDelegate: AnyObject {
    func updateFilter(filter: EventFilter)
}

import UIKit

class EventFilterViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var dateBackgroundView: UIView!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var useDateIntervalLabel: UILabel!
    @IBOutlet weak var dateErrorLabel: UILabel!
    @IBOutlet weak var dateIntervalSelectedSwitch: UISwitch!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var avaliablePositionLabel: UILabel!
    @IBOutlet weak var avaliablePositionSwitch: UISwitch!
    @IBOutlet weak var createdByMeLabel: UILabel!
    @IBOutlet weak var createdByMeSwitch: UISwitch!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var clearFiltersButtons: UIButton!
    
    private weak var delegate: EventFilterDelegate?
    private var filterData:EventFilter?
    
    public func delegate(delegate:EventFilterDelegate?){
        self.delegate = delegate
    }
    
    public func setFilterData( filterData:EventFilter) {
        self.filterData = filterData
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFilterData()
        setupUI()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func applyButtonTapped(_ sender: UIButton) {
        
        self.filterData = EventFilter()
        
        if cityTextField.text == "" {
            self.filterData?.local = nil
        } else {
            self.filterData?.local = self.cityTextField.text
        }
        
        if dateIntervalSelectedSwitch.isOn {
            self.filterData?.startDate = self.startDatePicker.date
            self.filterData?.endDate = self.endDatePicker.date
        } else {
            self.filterData?.startDate = nil
            self.filterData?.endDate = nil
        }
        
        if eventNameTextField.text == "" {
            self.filterData?.title = nil
        } else {
            self.filterData?.title = self.eventNameTextField.text
        }
        
        self.filterData?.isAvaliable = self.avaliablePositionSwitch.isOn
        self.filterData?.isOwner = self.createdByMeSwitch.isOn
        
        if self.eventNameTextField.text != "" { self.filterData?.totalFilters += 1 }
        if self.cityTextField.text != "" { self.filterData?.totalFilters += 1 }
        if self.dateIntervalSelectedSwitch.isOn != false { filterData?.totalFilters += 1 }
        if self.avaliablePositionSwitch.isOn != false { filterData?.totalFilters += 1 }
        if self.createdByMeSwitch.isOn != false { filterData?.totalFilters += 1 }
        
        if self.startDatePicker.date > self.endDatePicker.date {
            self.dateErrorLabel.text = "Data final deve ser maior do que inicial"
            self.dateErrorLabel.textColor = .red
            self.dateErrorLabel.adjustsFontSizeToFitWidth = true
            self.dateErrorLabel.minimumScaleFactor = 0.5
            self.dateErrorLabel.isHidden = false
        } else {
            self.dateErrorLabel.isHidden = true           
            self.delegate?.updateFilter(filter: self.filterData ?? EventFilter())
            self.dismiss(animated: true, completion: nil)
        }
      
    }
    
    @IBAction func clearFilterButtonTapped(_ sender: UIButton) {
        
        self.eventNameTextField.text = ""
        self.cityTextField.text = ""
        self.dateIntervalSelectedSwitch.isOn = false
        self.startDatePicker.date = Date()
        self.endDatePicker.date = Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date()
        self.avaliablePositionSwitch.isOn = false
        self.createdByMeSwitch.isOn = false
        self.filterData?.totalFilters = 0
        
    }
    
}

// MARK: UI Functions
extension EventFilterViewController {
    func setupUI(){
        self.cancelButton.setTitle("Cancelar", for: .normal)
        self.cityLabel.text = "Cidade"
        self.cityTextField.placeholder = "Cidade"
        self.useDateIntervalLabel.text = "Usar intervalo de datas"
        self.startDateLabel.text = "Data inicial"
        self.endDateLabel.text = "Data final"
        self.eventNameLabel.text = "Nome do Evento"
        self.eventNameTextField.placeholder = "Nome do Evento"
        self.avaliablePositionLabel.text = "Vaga disponível"
        self.createdByMeLabel.text = "Criados por mim"
        
        self.applyButton.configuration = nil
        self.applyButton.setTitle("Aplicar", for: .normal)
        self.applyButton.setTitleColor(.white, for: .normal)
        self.applyButton.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.applyButton.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
        self.applyButton.layer.cornerRadius = 8
        
        self.clearFiltersButtons.configuration = nil
        self.clearFiltersButtons.setTitle("Limpar Filtros", for: .normal)
        self.clearFiltersButtons.setTitleColor(.white, for: .normal)
        self.clearFiltersButtons.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.clearFiltersButtons.backgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        self.clearFiltersButtons.layer.cornerRadius = 8
        
        self.dateBackgroundView.layer.borderWidth = 0.5
        self.dateBackgroundView.layer.borderColor = #colorLiteral(red: 0.7843137255, green: 0.7764705882, blue: 0.7764705882, alpha:  1 )
        self.dateBackgroundView.layer.cornerRadius = 10
        
        if self.dateIntervalSelectedSwitch.isOn {
            self.startDateLabel.textColor = .black
            self.endDateLabel.textColor = .black
            self.startDatePicker.isEnabled = true
            self.endDatePicker.isEnabled = true
        } else {
            self.startDateLabel.textColor = #colorLiteral(red: 0.7843137255, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
            self.endDateLabel.textColor = #colorLiteral(red: 0.7843137255, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
            self.startDatePicker.isEnabled = false
            self.endDatePicker.isEnabled = false
        }
        
        self.startDatePicker.datePickerMode = .date
        self.startDatePicker.preferredDatePickerStyle = .compact
        self.endDatePicker.datePickerMode = .date
        self.endDatePicker.preferredDatePickerStyle = .compact
        self.dateErrorLabel.isHidden = true
        
        self.dateIntervalSelectedSwitch.addTarget(self, action: #selector(dateSwitchChanged), for: UIControl.Event.valueChanged)
        
        self.eventNameTextField.delegate = self
        self.cityTextField.delegate = self
        
    }
    
    @objc func dateSwitchChanged(mySwitch: UISwitch) {
        if self.dateIntervalSelectedSwitch.isOn {
            self.startDateLabel.textColor = .black
            self.endDateLabel.textColor = .black
            self.startDatePicker.isEnabled = true
            self.endDatePicker.isEnabled = true
        } else {
            self.startDateLabel.textColor = #colorLiteral(red: 0.7843137255, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
            self.endDateLabel.textColor = #colorLiteral(red: 0.7843137255, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
            self.startDatePicker.isEnabled = false
            self.endDatePicker.isEnabled = false
        }
    }
}

//MARK: - User Defaults
extension EventFilterViewController {
    
    func loadFilterData() {
        
        self.cityTextField.text = self.filterData?.local
        self.eventNameTextField.text = self.filterData?.title
        
        let startDate = self.filterData?.startDate
        let endDate = self.filterData?.endDate
        
        if let _ = startDate, let _ = endDate{
            self.dateIntervalSelectedSwitch.isOn = true
        }

        if self.dateIntervalSelectedSwitch.isOn {
            self.startDatePicker.date = startDate ?? Date()
            self.endDatePicker.date = endDate ?? Date()
        } else {
            self.startDatePicker.date = startDate ?? Date()
            self.endDatePicker.date = Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date()
        }
        
        self.avaliablePositionSwitch.isOn = self.filterData?.isAvaliable ?? false
        self.createdByMeSwitch.isOn = self.filterData?.isOwner ?? false
        
    }
      
}

extension EventFilterViewController: UITextFieldDelegate {
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
