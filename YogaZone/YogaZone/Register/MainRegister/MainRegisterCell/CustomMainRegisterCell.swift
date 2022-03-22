//
//  CustomMainRegisterCell.swift
//  YogaZone
//
//  Created by Marcus on 14/03/22.
//

import UIKit

class CustomMainRegisterCell: UITableViewCell {

    static let identifier:String = "CustomMainRegisterCell"
        
    @IBOutlet weak var registerUserTextField: UITextField!
    
    
    static func nib()-> UINib{
            return UINib(nibName: self.identifier, bundle: nil)
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            clearBackgroundColorWhenSelectCell()
        }
        
        func clearBackgroundColorWhenSelectCell() {
            let view = UIView()
            view.backgroundColor = UIColor.clear
            selectedBackgroundView = view
        }
}

