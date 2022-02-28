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
    
    @IBOutlet weak var PositionsTitleLabel: UILabel!
    
    @IBOutlet weak var NumberOfPositionsLabel: UILabel!
    
 
    
    //Start Train Button
    @IBOutlet weak var startTrainButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configBackButton()
        CircleCaloriesImage.image = UIImage(named: "CircleCaloriesImage")
        CircleMinutesImage.image = UIImage(named: "CircleMinutesImage")
        CirclePositionsImage.image = UIImage(named: "CirclePositionsImage")
        tappedArrowVoltar.image = UIImage(named: "arrowVoltarCinza")
        
        // Hide Back Button from UINavigationItem
        self.navigationItem.setHidesBackButton(true, animated: true)

    }
    
    private func configBackButton(){
        let tapBackButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedBackButton))
        self.tappedArrowVoltar.addGestureRecognizer(tapBackButton)
        self.tappedArrowVoltar.isUserInteractionEnabled = true
        
    }
    
    @objc func tappedBackButton(){
        self.navigationController?.popViewController(animated: true)
    }

    
    @IBAction func tappedStartTrainButton(_ sender: UIButton) {
    }
    
}
