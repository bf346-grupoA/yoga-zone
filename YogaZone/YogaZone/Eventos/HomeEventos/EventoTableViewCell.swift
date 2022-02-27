//
//  EventoTableViewCell.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 26/02/22.
//

import UIKit

class EventoTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
