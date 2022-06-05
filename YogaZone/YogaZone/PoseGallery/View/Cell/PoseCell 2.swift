//
//  PoseCell.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 12/03/22.
//

import UIKit

class PoseCell: UITableViewCell {

    static let identifier = "PoseCell"
    static func getNib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var poseImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 4
        self.contentView.layoutMargins.left = 10
        self.contentView.layoutMargins.right = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(_ pose: Pose) {
        self.titleLabel.text = pose.name
        self.descriptionLabel.text = pose.categories.map{ $0.name }.joined(separator: ", ")
        self.poseImageView.image = UIImage(named: "\(pose.id)")
    }
}
