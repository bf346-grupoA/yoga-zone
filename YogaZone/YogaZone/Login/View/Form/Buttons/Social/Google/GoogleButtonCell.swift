//
//  GoogleButtonCell.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import UIKit

class GoogleButtonCell: UITableViewCell {
    weak var delegate: Navigable?

    @IBOutlet weak var googleSocialButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction func onTapGoogleLogin(_ sender: UIButton) {
        self.delegate?.navigateTo(routeIndex: 2)
    }
    
}


// MARK: Static properties & methods
extension GoogleButtonCell {
    static let identifier: String = "GoogleButtonCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
