//
//  RegisterCell.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import UIKit

class RegisterButtonCell: UITableViewCell {
    weak var delegate: Navigable?
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func tappedRegisterButton(_ sender: Any) {
        self.delegate?.navigateTo(routeIndex: 4)
    }
    
}

// MARK: Static properties & methods
extension RegisterButtonCell {
    static let identifier: String = "RegisterButtonCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
