//
//  TreinoUmController.swift
//  YogaZone
//
//  Created by Marcus on 20/02/22.
//

import UIKit


class TreinoUmController: UIViewController {
    
    @IBOutlet weak var circleBackground: UIImageView!
    
    @IBOutlet weak var titleTreinoDeYoga: UILabel!
    
    @IBOutlet weak var descriptionTreinoDeYoga: UILabel!
    
    @IBOutlet weak var tappedArrowVoltar: UIImageView!
    
    @IBOutlet weak var timeDurationImage: UIImageView!
    
    @IBOutlet weak var levelExerciceImage: UIImageView!
    
    @IBOutlet weak var timeDurationLabel: UILabel!
    
    @IBOutlet weak var levelExerciceLabel: UILabel!
    
    @IBOutlet weak var seeTrainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleBackground.image = UIImage(named: "circleBackground")
//        view.backgroundColor = UIColor(red: 114/255, green: 103/255, blue: 203/255, alpha: 1.0) /* #7267cb */
        tappedArrowVoltar.image = UIImage(named: "arrowVoltar")
        timeDurationImage.image = UIImage(named: "timeDuration")
        levelExerciceImage.image = UIImage(named: "levelExercice")
        seeTrainButton.setTitle("Ver Treino", for: .normal)
    }
    
    @IBAction func tappedSeeTrainButton(_ sender: UIButton) {
    }
    /*https://www.youtube.com/watch?v=lICHh10y_XU*/
}
