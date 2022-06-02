//
//  ResetPasswordCell.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import UIKit

class ResetPasswordCell: UITableViewCell {
    weak var delegate: NavigationDelegate?
    
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func onTapResetPassword(_ sender: UIButton) {
        self.delegate?.navigateTo(routeIndex: 0)
    }
    
}


// MARK: Static properties & methods
extension ResetPasswordCell {
    static let identifier: String = "ResetPasswordCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
