//
//  MyTableViewCell.swift
//  BmiX
//
//  Created by Bruno Lopes on 22/04/22.
//

import UIKit
protocol ResultTableViewCellProtocol{
    func actionSaveButton()
}

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var waitingResultLabel: UILabel!
    @IBOutlet weak var possibleConsequencesLabel: UILabel!
    @IBOutlet weak var waitingPossibleConsequencesLabel: UILabel!
    @IBOutlet weak var imageIndex: UIImageView!
    @IBOutlet weak var numberIndexLabel: UILabel!
    @IBOutlet weak var caseIndexLabel: UILabel!
    @IBOutlet weak var buttonTapped: UIButton!
    
    var delegate: ResultTableViewCellProtocol?
    
    static let identifier: String = "ResultTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configLabels()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.buttonTapped.layer.cornerRadius = 7
    }
    
    public func setupCell(value:Double){
        var image: String = ""
        var result: String = ""
        var possibleCons: String = ""
        var color: UIColor
        var caseIndex: String = ""
        var numberIndex: String = ""
        
        switch value{
            case 0..<BmiNumber.underWeight.rawValue:
            image = PicImage.underWeight.rawValue
            result = String(format: " %.2f IMC", value)
            possibleCons = PossibleConsequences.underWeight.rawValue
            caseIndex = CaseIndex.underWeight.rawValue
            numberIndex = NumberIndex.underWeight.rawValue
            color = .blue
                
            case BmiNumber.normalMinimum.rawValue..<BmiNumber.normalMaximum.rawValue:
                image = PicImage.normal.rawValue
                result = String(format: " %.2f IMC", value)
                possibleCons = PossibleConsequences.normal.rawValue
                caseIndex = CaseIndex.normal.rawValue
                numberIndex = NumberIndex.normal.rawValue
                color = #colorLiteral(red: 0.003716206877, green: 0.8191881776, blue: 0.4462348819, alpha: 1)
            
            case BmiNumber.overWeightMinimum.rawValue..<BmiNumber.overWeightMaximum.rawValue:
                image = PicImage.overWeight.rawValue
                result = String(format: " %.2f IMC", value)
                possibleCons = PossibleConsequences.overWeight.rawValue
                caseIndex = CaseIndex.overWeight.rawValue
                numberIndex = NumberIndex.overWeight.rawValue
                color = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
            
            case BmiNumber.obeseWeightMinimum.rawValue..<BmiNumber.obeseWeightMaximum.rawValue:
                image = PicImage.obese.rawValue
                result = String(format: " %.2f IMC", value)
                possibleCons = PossibleConsequences.obese.rawValue
                caseIndex = CaseIndex.obese.rawValue
                numberIndex = NumberIndex.obese.rawValue
                color = .orange
           
            default:
                image = PicImage.extremelyObese.rawValue
                result = String(format: " %.2f IMC", value)
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
    
    func configLabels(){
        self.resultLabel.font = UIFont(name: "Comfortaa-Bold", size: 25)
        self.waitingResultLabel.font = UIFont(name: "Comfortaa-Bold", size: 15)
        self.possibleConsequencesLabel.font = UIFont(name: "Comfortaa-Bold", size: 25)
        self.waitingPossibleConsequencesLabel.font = UIFont(name: "Comfortaa-Bold", size: 15)
        self.numberIndexLabel.font = UIFont(name: "Comfortaa-Bold", size: 20)
        self.caseIndexLabel.font = UIFont(name: "Comfortaa-Bold", size: 20)
        self.buttonTapped.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 20)
    }
}
