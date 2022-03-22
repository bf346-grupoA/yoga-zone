//
//  HistoricoTableViewCell.swift
//  YogaZone
//
//  Created by Marcelo Silva on 10/03/22.
//

import UIKit

class HistoricoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var weigthLabel: UILabel!
    @IBOutlet weak var remainLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
