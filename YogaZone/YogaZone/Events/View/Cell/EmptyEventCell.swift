//
//  EmptyEventCell.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 06/06/22.
//

import UIKit

class EmptyEventCell: UITableViewCell {
    
    @IBOutlet weak var noActivitiesImageView: UIImageView!
    @IBOutlet weak var noActivitiesLabel: UILabel!
    
    static let identifier = "EmptyEventCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.noActivitiesLabel.text = "Não foram encontradas atividades"
        self.noActivitiesLabel.layer.backgroundColor = #colorLiteral(red: 0.8247583508, green: 0.8047978282, blue: 0.8043709397, alpha: 0.05)
        self.noActivitiesLabel.textColor = #colorLiteral(red: 0.2039215686, green: 0.3490196078, blue: 0.862745098, alpha: 1)
        self.noActivitiesLabel.layer.cornerRadius = 8
        self.noActivitiesLabel.font = UIFont(name: "Comfortaa-Bold", size: 18)
        self.noActivitiesLabel.adjustsFontSizeToFitWidth = true
        self.noActivitiesLabel.minimumScaleFactor = 0.5
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
}
