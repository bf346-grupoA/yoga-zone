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
        self.setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configLabels(){
        self.durationNameLabel.font = UIFont(name: "Comfortaa-Bold", size: 14)
    }
    
    func setupUI(){
        self.configLabels()
    }
}
