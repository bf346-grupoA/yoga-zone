//
//  TreinoFinalizadoVC.swift
//  YogaZone
//
//  Created by Marcus on 28/02/22.
//

import UIKit

class TreinoFinalizadoVC: UIViewController {

    @IBOutlet weak var parabensTrofeuImage: UIImageView!
    
    @IBOutlet weak var CongratulationsLabel: UILabel!
    
    @IBOutlet weak var CongratulationsDescriptionLabel: UILabel!
    
    @IBOutlet weak var CongratulationsCaloriesLabel: UILabel!
    
    @IBOutlet weak var SocialMediaShareButton: UIButton!
    
    @IBOutlet weak var GoToHomeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parabensTrofeuImage.image = UIImage(named: "parabensTrofeuImage")
        
    }

    @IBAction func tappedSocialMediaButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedGoToHomeButton(_ sender: UIButton) {
    }
    
    
    
}
