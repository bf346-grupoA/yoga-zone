//
//  RegisterCell.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import UIKit

class RegisterCell: UITableViewCell {

    @IBOutlet weak var registerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func tappedRegisterButton(_ sender: Any) {
        print(#function)
    }
    
}

// MARK: Static properties & methods
extension RegisterCell {
    static let identifier: String = "RegisterCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
