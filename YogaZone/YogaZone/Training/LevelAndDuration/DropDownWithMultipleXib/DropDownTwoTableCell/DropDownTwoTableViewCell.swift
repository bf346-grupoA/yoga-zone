//
//  DropDownTwoTableViewCell.swift
//  MakeDropDown
//
//  Created by Marcus on 20/03/22.
//

import UIKit

class DropDownTwoTableViewCell: UITableViewCell {

    @IBOutlet weak var levelNameLabel: UILabel!
    
    var indexPos: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
