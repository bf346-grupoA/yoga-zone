//
//  TreinoListagemController.swift
//  YogaZone
//
//  Created by Marcus on 21/02/22.
//

import UIKit

class TreinoListagemController: UIViewController {

    @IBOutlet weak var tappedArrowVoltar: UIImageView!
    
    @IBOutlet weak var TitleTreino: UILabel!
    
    //Calories
    @IBOutlet weak var CircleCaloriesImage: UIImageView!
    
    @IBOutlet weak var NumberOfCaloriesLabel: UILabel!
    
    @IBOutlet weak var CaloriesTitleLabel: UILabel!
    
    // Minutes
    @IBOutlet weak var CircleMinutesImage: UIImageView!
    
    @IBOutlet weak var NumberOfMinutesLabel: UILabel!
    
    @IBOutlet weak var MinutesTitleLabel: UILabel!
    
    //Positions
    @IBOutlet weak var CirclePositionsImage: UIImageView!
    
    @IBOutlet weak var NumberOfPositionsLabel: UILabel!
    
    @IBOutlet weak var PositionsTitleLabel: UILabel!
    
    //Start Train Button
    @IBOutlet weak var startTrainButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tappedArrowVoltar.image = UIImage(named: "arrowVoltarCinza")
        CircleCaloriesImage.image = UIImage(named: "CircleCaloriesImage")
        CircleMinutesImage.image = UIImage(named: "CircleMinutesImage")
        CirclePositionsImage.image = UIImage(named: "CirclePositionsImage")

    }

    
    @IBAction func tappedStartTrainButton(_ sender: UIButton) {
    }
    
}
