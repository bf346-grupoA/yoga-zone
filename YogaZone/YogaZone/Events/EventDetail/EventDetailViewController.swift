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
        titleLabel.text = "Evento"
        nameLabel.text = "Nome"
        dateLabel.text = "Data"
        hourLabel.text = "Hora"
        numberOfParticipantsLabel.text = "Participantes"
        localLabel.text = "Local"
        descriptionLabel.text = "Descrição"
        availableVacanciesLabel.text = "Vagas disponíveis"
        confirmParticipationButton.setTitle("Confirmar Participação", for: .normal)
        
    }
    
}
