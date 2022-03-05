//
//  TreinoCustomCell.swift
//  YogaZone
//
//  Created by Marcus on 01/03/22.
//

import UIKit

class TreinoCustomCell: UITableViewCell {

    @IBOutlet weak var treinoImageView: UIImageView!
    
    @IBOutlet weak var treinoDescriptionLabel: UILabel!
    
    @IBOutlet weak var treinoDurationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
