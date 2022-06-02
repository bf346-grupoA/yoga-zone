//
//  FacebookButtonCell.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import UIKit

class FacebookButtonCell: UITableViewCell {
    weak var delegate: Navigable?
    
    @IBOutlet weak var facebookSocialButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func onTapFacebookLogin(_ sender: UIButton) {
        self.delegate?.navigateTo(routeIndex: 3)
    }
}


// MARK: Static properties & methods
extension FacebookButtonCell {
    static let identifier: String = "FacebookButtonCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
