//
//  EventCellTableViewCell.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 01/03/22.
//

import UIKit

class EventCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
