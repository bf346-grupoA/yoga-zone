//
//  FormCell.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import UIKit

class FormCell: UITableViewCell {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordTextField: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}

// MARK: Static properties & methods
extension FormCell {
    static let identifier: String = "FormCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
