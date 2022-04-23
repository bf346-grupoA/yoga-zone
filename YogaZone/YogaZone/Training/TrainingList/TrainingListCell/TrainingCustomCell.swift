//
//  TreinoCustomCell.swift
//  YogaZone
//
//  Created by Marcus on 01/03/22.
//

import UIKit

class TrainingCustomCell: UITableViewCell {

    @IBOutlet weak var treinoImageView: UIImageView!
    
    @IBOutlet weak var treinoDescriptionLabel: UILabel!
    
    @IBOutlet weak var treinoDurationLabel: UILabel!
    
    
    static let identifier:String = "TrainingCustomCell"
    
    static func nib()-> UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearBackgroundColorWhenSelectCell()
    }
    
    func clearBackgroundColorWhenSelectCell() {
           let view = UIView()
           view.backgroundColor = UIColor.clear
           selectedBackgroundView = view
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
