//
//  EventDetailViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 25/02/22.
//

import UIKit

class EventDetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var confirmContainer: UIView!
    @IBOutlet weak var cancelContainer: UIView!
    @IBOutlet weak var editContainer: UIView!
    @IBOutlet weak var finalizedContainer: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var eventHourLabel: UILabel!
    @IBOutlet weak var numberOfParticipantsLabel: UILabel!
    @IBOutlet weak var eventNumberOfParticipantsLabel: UILabel!
    @IBOutlet weak var localLabel: UILabel!
    @IBOutlet weak var eventLocalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var availableVacanciesLabel: UILabel!
    @IBOutlet weak var eventAvailableVacanciesLabel: UILabel!
    
    var event: Event?
    
    private var containerViewController: FinalizedContainerViewController?
    var avaliableVacancies = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
        configureContainerView()
    }
    
}

// MARK: UI Functions
extension EventDetailViewController {
    
    func setupNavigationBar(){
        self.navigationItem.title = "Evento"
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
    
    func setupUI(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        
        self.nameLabel.text = "Nome"
        self.dateLabel.text = "Data"
        self.hourLabel.text = "Hora"
        self.numberOfParticipantsLabel.text = "Participantes"
        self.localLabel.text = "Local"
        self.descriptionLabel.text = "Descrição"
        self.availableVacanciesLabel.text = "Vagas disponíveis"
        
        self.eventNameLabel.text = self.event?.title
        self.eventDateLabel.text = dateFormatter.string(from: event?.date ?? Date())
        self.eventHourLabel.text = self.event?.startTime
        self.eventNumberOfParticipantsLabel.text = String(self.event?.numberOfParticipants ?? 0)
        self.eventLocalLabel.text = self.event?.local
        self.descriptionTextView.text = self.event?.description
        self.avaliableVacancies = (self.event?.maximumOfParticipants ?? 0) - (self.event?.numberOfParticipants ?? 0)
        self.eventAvailableVacanciesLabel.text = String(avaliableVacancies)
        
    }
    
    func configureContainerView() {
        
        let today = Date()
        
        if self.event?.date ?? Date() < today {
            
            self.confirmContainer.isHidden = true
            self.cancelContainer.isHidden = true
            self.editContainer.isHidden = true
            self.finalizedContainer.isHidden = false
            self.containerViewController?.setLabelText(text: "Evento Finalizado")
            
        } else if self.event?.isOwner == true {
            
            self.confirmContainer.isHidden = true
            self.cancelContainer.isHidden = true
            self.editContainer.isHidden = false
            self.finalizedContainer.isHidden = true
            
        } else if self.event?.isParticipating == true {
            
            self.confirmContainer.isHidden = true
            self.cancelContainer.isHidden = false
            self.editContainer.isHidden = true
            self.finalizedContainer.isHidden = true
            
        } else if avaliableVacancies > 0 {
            
            self.confirmContainer.isHidden = false
            self.cancelContainer.isHidden = true
            self.editContainer.isHidden = true
            self.finalizedContainer.isHidden = true
            
        } else if avaliableVacancies == 0 {
           
            self.confirmContainer.isHidden = true
            self.cancelContainer.isHidden = true
            self.editContainer.isHidden = true
            self.finalizedContainer.isHidden = false
            self.containerViewController?.setLabelText(text: "Não há mais vagas disponíveis")
            
        }
        
    }
    
}

// MARK: Navigation Bar Customization
extension EventDetailViewController {
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: Container View Segue
extension EventDetailViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFinalizedContainer" {
            containerViewController = segue.destination as? FinalizedContainerViewController
        }
    }
    
}
