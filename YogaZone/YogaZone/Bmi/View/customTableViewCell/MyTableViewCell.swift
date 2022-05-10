//
//  MyTableViewCell.swift
//  BmiX
//
//  Created by Bruno Lopes on 22/04/22.
//

import UIKit
protocol MyTableViewCellProtocol{
    func actionSaveButton()

}

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var waitingResultLabel: UILabel!
    
    @IBOutlet weak var possibleConsequencesLabel: UILabel!
    
    @IBOutlet weak var waitingPossibleConsequencesLabel: UILabel!
    
    @IBOutlet weak var imageIndex: UIImageView!
    
    @IBOutlet weak var numberIndexLabel: UILabel!
    
    @IBOutlet weak var caseIndexLabel: UILabel!
    
    @IBOutlet weak var buttonTapped: UIButton!
    
    
    var delegate: MyTableViewCellProtocol?
    
    static let identifier: String = "MyTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.buttonTapped.layer.cornerRadius = 7
    }
    
    
    public func setupCell(value:Double){
        print(value)
        var image: String = ""
        var result: String = ""
        var possibleCons: String = ""
        var color: UIColor
        var caseIndex: String = ""
        var numberIndex: String = ""
        
        switch value{
            case 0..<BmiNumber.underWeight.rawValue:
            image = PicImage.underWeight.rawValue
            result = String(format: " %.2f BMI", value)
            possibleCons = PossibleConsequences.underWeight.rawValue
            caseIndex = CaseIndex.underWeight.rawValue
            numberIndex = NumberIndex.underWeight.rawValue
            color = .blue
                
            
            case BmiNumber.normalMinimum.rawValue..<BmiNumber.normalMaximum.rawValue:
                image = PicImage.normal.rawValue
                result = String(format: " %.2f BMI", value)
                possibleCons = PossibleConsequences.normal.rawValue
                caseIndex = CaseIndex.normal.rawValue
                numberIndex = NumberIndex.normal.rawValue
                color = .green
            
            case BmiNumber.overWeightMinimum.rawValue..<BmiNumber.overWeightMaximum.rawValue:
                image = PicImage.overWeight.rawValue
                result = String(format: " %.2f BMI", value)
                possibleCons = PossibleConsequences.overWeight.rawValue
                caseIndex = CaseIndex.overWeight.rawValue
                numberIndex = NumberIndex.overWeight.rawValue
            color = .systemYellow
            
            case BmiNumber.obeseWeightMinimum.rawValue..<BmiNumber.obeseWeightMaximum.rawValue:
                image = PicImage.obese.rawValue
                result = String(format: " %.2f BMI", value)
                possibleCons = PossibleConsequences.obese.rawValue
                caseIndex = CaseIndex.obese.rawValue
                numberIndex = NumberIndex.obese.rawValue
                color = .orange
           
            default:
                image = PicImage.extremelyObese.rawValue
                result = String(format: " %.2f BMI", value)
                possibleCons = PossibleConsequences.extremelyObese.rawValue
                caseIndex = CaseIndex.extremelyObese.rawValue
                numberIndex = NumberIndex.extremelyObese.rawValue
                color = .red
            
        }
        
        waitingPossibleConsequencesLabel.text = possibleCons
        waitingPossibleConsequencesLabel.textColor = color
        waitingResultLabel.text = result
        waitingResultLabel.textColor = color
        numberIndexLabel.text = numberIndex
        numberIndexLabel.textColor = color
        caseIndexLabel.text = caseIndex
        caseIndexLabel.textColor = color
        buttonTapped.backgroundColor = color
        imageIndex.image = UIImage(named:image)
        
       
        
    }
    
    
    @IBAction func tappedCalculate(_ sender: Any) {
        self.delegate?.actionSaveButton()
        
    }
    
}