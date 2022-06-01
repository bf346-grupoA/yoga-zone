//
//  TreinoCustomCell.swift
//  YogaZone
//
//  Created by Marcus on 01/03/22.
//

import UIKit

class TrainingCustomCell: UITableViewCell {

    @IBOutlet weak var treinoImageView: UIImageView!
    @IBOutlet weak var treinoDescriptionLabel: UILabel!
    @IBOutlet weak var treinoDurationLabel: UILabel!
    
    
    static let identifier:String = "TrainingCustomCell"
    
    static func nib()-> UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupCell(data:ExercicesModel){
            self.treinoDescriptionLabel.text = data.exercise
            self.treinoDurationLabel.text = String(data.seconds ?? 0)+"s"
            self.treinoImageView.image = UIImage(named: data.exercise ?? "")
        }
        
    
    //MARK: - SetupUI
    func configLabels(){
        self.treinoDescriptionLabel.font = UIFont(name: "Comfortaa-Bold", size: 14)
        self.treinoDurationLabel.font = UIFont(name: "Comfortaa-Bold", size: 14)
        self.treinoDurationLabel.textAlignment = .center
    }
    
    func clearBackgroundColorWhenSelectCell() {
           let view = UIView()
           view.backgroundColor = UIColor.clear
           selectedBackgroundView = view
       }
   
    func setupUI(){
        self.configLabels()
        self.clearBackgroundColorWhenSelectCell()
    }
}
