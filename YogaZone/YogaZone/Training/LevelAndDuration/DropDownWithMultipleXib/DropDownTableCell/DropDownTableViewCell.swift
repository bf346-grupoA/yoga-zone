//
//  DropDownTableViewCell.swift
//  MakeDropDown
//
//  Created by Marcus on 20/03/22.
//

import UIKit

class DropDownTableViewCell: UITableViewCell {

    
    @IBOutlet weak var durationNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
