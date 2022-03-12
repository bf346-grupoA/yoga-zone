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
        view.layer.cornerRadius = 10
    }
    
    static func nib()->UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
        
    func setupCell(event: Event){
        self.eventTitleLabel.text = event.title
        self.eventLocalLabel.text = event.local
        self.eventDateLabel.text = event.date
        self.eventNumberOfParticipantsLabel.text = String(event.numberOfParticipants)
        
        if event.isParticipating == false {
            self.eventIsParticipatingLabel.isHidden = true
            self.eventIsParticipatingImageView.isHidden = true
        }
        
        if event.isOwner == false {
            self.eventIsOwnerLabel.isHidden = true
            self.eventIsOwnerImageView.isHidden = true
        } else {
            self.eventIsOwnerLabel.isHidden = false
            self.eventIsOwnerImageView.isHidden = false
            self.eventIsParticipatingLabel.isHidden = false
            self.eventIsParticipatingImageView.isHidden = false
        }
        
    }
    
}
