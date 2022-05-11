//
//  PoseCategoryCell.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 12/03/22.
//

import UIKit

class PoseCategoryCell: UITableViewCell {
    static let identifier = "PoseCategoryCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(category: PoseCategory) {
        self.nameLabel.text = category.name
        self.descriptionLabel.text = category.description
    }
    
}
