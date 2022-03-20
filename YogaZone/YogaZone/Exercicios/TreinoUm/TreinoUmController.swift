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
    
    @IBOutlet weak var seeTrainButton: UIButton!
    
    private let dropDownOptionsDataSourceLevel = ["Iniciante", "Pouco Experiente", "Intermediário","Guru"]
    
    private let dropDownOptionsDataSourceDuration = ["10 min", "15 min", "20 min"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedArrowVoltar.image = UIImage(named: "arrowVoltar")
        circleBackground.image = UIImage(named: "circleBackground")
        timeDurationImage.image = UIImage(named: "timeDuration")
        levelExerciceImage.image = UIImage(named: "levelExercice")
        
    }
    
    @IBAction func tappedSeeTrainButton(_ sender: UIButton) {
        let vc = TreinoListagemController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
