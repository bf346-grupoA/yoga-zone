//
//  TableViewCellMyProgress.swift
//  BmiX
//
//  Created by Marcelo Silva on 23/04/22.
//

import UIKit

class TableViewCellMyProgress: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bmiIndex: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    static let identifier: String = "TableViewCellMyProgress"
    static func getNib() -> UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    public func setupCell(myProgress:MyProgress){
        self.dateLabel.text = myProgress.date
        self.bmiIndex.text = myProgress.result
        self.weightLabel.text = myProgress.weight
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configLabels(){
        self.dateLabel.font = UIFont(name: "Comfortaa-Bold", size: 1)
        self.bmiIndex.font = UIFont(name: "Comfortaa-Bold", size: 14)
        self.weightLabel.font = UIFont(name: "Comfortaa-Bold", size: 14)
    }
    
}
