//
//  SeparatorCell.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import UIKit

class SeparatorCell: UITableViewCell {
    
    @IBOutlet weak var firstSeparatorView: UIView!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var secondSeparatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.firstSeparatorView.awakeFromNib()
        self.secondSeparatorView.awakeFromNib()

    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.firstSeparatorView.backgroundColor = .black
        self.secondSeparatorView.backgroundColor = .black
        self.firstSeparatorView.layer.borderWidth = 1
        self.secondSeparatorView.layer.borderWidth = 1
    }
}

// MARK: Static properties & methods
extension SeparatorCell {
    static let identifier: String = "SeparatorCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
