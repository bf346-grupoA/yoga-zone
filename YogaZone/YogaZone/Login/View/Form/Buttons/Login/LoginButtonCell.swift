//
//  LoginButtonCell.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import UIKit

class LoginButtonCell: UITableViewCell {
    weak var delegate: Navigable?
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func onTapLoginButton(_ sender: UIButton) {
        self.delegate?.navigateTo(routeIndex: 1)
    }
    
}


// MARK: Static properties & methods
extension LoginButtonCell {
    static let identifier: String = "LoginButtonCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
