//
//  EventDetailViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 25/02/22.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var eventHoutLabel: UILabel!
    @IBOutlet weak var numberOfParticipantsLabel: UILabel!
    @IBOutlet weak var eventNumberOfParticipantsLabel: UILabel!
    @IBOutlet weak var localLabel: UILabel!
    @IBOutlet weak var eventLocalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var availableVacanciesLabel: UILabel!
    @IBOutlet weak var eventAvailableVacanciesLabel: UILabel!
    @IBOutlet weak var confirmParticipationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
        
}

// MARK: UI Functions
extension EventDetailViewController {
    func setupUI(){
        self.titleLabel.text = "Evento"
        self.nameLabel.text = "Nome"
        self.dateLabel.text = "Data"
        self.hourLabel.text = "Hora"
        self.numberOfParticipantsLabel.text = "Participantes"
        self.localLabel.text = "Local"
        self.descriptionLabel.text = "Descrição"
        self.availableVacanciesLabel.text = "Vagas disponíveis"
        self.confirmParticipationButton.setTitle("Confirmar Participação", for: .normal)
    }
    
}
