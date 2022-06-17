//
//  EventCellTableViewCell.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 01/03/22.
//

import UIKit

class EventCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventLocalLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventIsOwnerImageView: UIImageView!
    @IBOutlet weak var eventIsOwnerLabel: UILabel!
    @IBOutlet weak var eventIsParticipatingLabel: UILabel!
    @IBOutlet weak var eventIsParticipatingImageView: UIImageView!
    @IBOutlet weak var eventNumberOfParticipantsLabel: UILabel!
    
    static let identifier:String = "EventCell"
  
    override func awakeFromNib() {
        super.awakeFromNib()
        self.view.layer.cornerRadius = 10
    }
    
    static func nib()->UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    func setupUI(){
        self.eventTitleLabel.minimumScaleFactor = 0.5
        self.eventTitleLabel.adjustsFontSizeToFitWidth = true
        
        self.eventLocalLabel.minimumScaleFactor = 0.5
        self.eventLocalLabel.adjustsFontSizeToFitWidth = true
        
        self.eventDateLabel.minimumScaleFactor = 0.5
        self.eventDateLabel.adjustsFontSizeToFitWidth = true
        
        self.eventIsOwnerLabel.minimumScaleFactor = 0.5
        self.eventIsOwnerLabel.adjustsFontSizeToFitWidth = true
        
        self.eventIsParticipatingLabel.minimumScaleFactor = 0.5
        self.eventIsParticipatingLabel.adjustsFontSizeToFitWidth = true
        
        self.eventNumberOfParticipantsLabel.minimumScaleFactor = 0.5
        self.eventNumberOfParticipantsLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupCell(event: Event){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        
        self.eventTitleLabel.text = event.title
        self.eventLocalLabel.text = event.local
        self.eventDateLabel.text = dateFormatter.string(from: event.date)
        self.eventNumberOfParticipantsLabel.text = String(event.numberOfParticipants) + " / " + String(event.maximumOfParticipants)
        
        if event.isOwner == true {
            self.eventIsOwnerLabel.isHidden = false
            self.eventIsOwnerImageView.isHidden = false
        } else {
            self.eventIsOwnerLabel.isHidden = true
            self.eventIsOwnerImageView.isHidden = true
        }
        
        if event.isParticipating == true {
            self.eventIsParticipatingLabel.isHidden = false
            self.eventIsParticipatingImageView.isHidden = false
        } else {
            self.eventIsParticipatingLabel.isHidden = true
            self.eventIsParticipatingImageView.isHidden = true
        }
        
    }
    
}
