//
//  FormFieldCell.swift
//  YogaZone
//
//  Created by Marcus on 14/03/22.
//

import UIKit

class FormFieldCell: UITableViewCell {
        
    @IBOutlet weak var formTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearBackgroundColorWhenSelectCell()
        setupUI()
    }
    
    private func setupUI() {
        self.formTextField.font = UIFont(name: "Comfortaa-Bold", size: 16)
    }
    
    private func clearBackgroundColorWhenSelectCell() {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        selectedBackgroundView = view
    }
}

// MARK: Static Props and Methods
extension FormFieldCell {
    static let identifier: String = "FormFieldCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
