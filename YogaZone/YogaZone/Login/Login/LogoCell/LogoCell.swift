//
//  LogoCell.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import UIKit

class LogoCell: UITableViewCell {
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: Static properties & methods
extension LogoCell {
    static let identifier: String = "LogoCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
