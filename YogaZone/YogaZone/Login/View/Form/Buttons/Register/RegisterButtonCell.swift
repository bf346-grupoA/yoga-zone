//
//  RegisterButtonCell.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import UIKit

class RegisterButtonCell: UITableViewCell {
    weak var delegate: NavigationDelegate?

    @IBOutlet weak var registerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction func onTapRegisterButton(_ sender: UIButton) {
        // TODO: Back to routeIndex 2 after fix
        self.delegate?.navigateTo(routeIndex: 1)
    }
    
}


// MARK: Static properties & methods
extension RegisterButtonCell {
    static let identifier: String = "RegisterButtonCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
