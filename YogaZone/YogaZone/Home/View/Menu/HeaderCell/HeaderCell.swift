//
//  HeaderCell.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 23/03/22.
//

import UIKit

class HeaderCell: UITableViewCell {
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    weak var delegate: Navigable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.profileImageView.layer.cornerRadius =  30
        self.profileImageView.clipsToBounds = true
        self.profileImageView.contentMode = .scaleAspectFill
        self.profileImageView.image = #imageLiteral(resourceName: "profile-2")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onTap))
        self.profileImageView.addGestureRecognizer(tapGesture)
        self.profileImageView.isUserInteractionEnabled = true
    }
    
    @objc func onTap() {
         self.delegate?.navigateTo(routeIndex: 7)
     }
}

// MARK: Static properties & methods
extension HeaderCell {
    static let identifier: String = "HeaderCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}

