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
    @IBOutlet weak var dateIntervalSelectedSwitch: UISwitch!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var finalizedLabel: UILabel!
    @IBOutlet weak var finalizedSwitch: UISwitch!
    @IBOutlet weak var createdByMeLabel: UILabel!
    @IBOutlet weak var createdByMeSwitch: UISwitch!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var clearFiltersButtons: UIButton!
    
    weak var delegate: EventFilterDelegate?
    var filterData:EventFilter?
    
    public func delegate(delegate:EventFilterDelegate?){
        self.delegate = delegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func applyButtonTapped(_ sender: UIButton) {
        filterData = EventFilter()
        
        if cityTextField.text != "" {
            filterData?.local = cityTextField.text
        }
        
        if dateIntervalSelectedSwitch.isOn {
            filterData?.startDate = startDatePicker.date
            filterData?.endDate = endDatePicker.date
        }
        
        if eventNameTextField.text != "" {
            filterData?.title = eventNameTextField.text
        }
        
        filterData?.isFinalized = finalizedSwitch.isOn
        filterData?.isOwner = createdByMeSwitch.isOn
        
        self.delegate?.updateFilter(filter: filterData ?? EventFilter())
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clearFilterButtonTapped(_ sender: UIButton) {
        filterData = nil
        self.delegate?.updateFilter(filter: filterData ?? EventFilter())
        self.dismiss(animated: true, completion: nil)
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
        self.finalizedLabel.text = "Finalizados"
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
        
        self.startDateLabel.textColor = #colorLiteral(red: 0.7843137255, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
        self.endDateLabel.textColor = #colorLiteral(red: 0.7843137255, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
        self.startDatePicker.isEnabled = false
        self.endDatePicker.isEnabled = false
        
        self.startDatePicker.datePickerMode = .date
        self.startDatePicker.preferredDatePickerStyle = .compact
        self.endDatePicker.datePickerMode = .date
        self.endDatePicker.preferredDatePickerStyle = .compact
        
        self.dateIntervalSelectedSwitch.addTarget(self, action: #selector(dateSwitchChanged), for: UIControl.Event.valueChanged)
        
        let now = Date()
        endDatePicker.date = Calendar.current.date(byAdding: .month, value: 1, to: now) ?? Date()
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

