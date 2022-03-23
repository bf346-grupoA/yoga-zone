//
//  TrainingFinishedVC.swift
//  YogaZone
//
//  Created by Marcus on 28/02/22.
//

import UIKit

class TrainingFinishedVC: UIViewController {

    @IBOutlet weak var parabensTrofeuImage: UIImageView!
    
    @IBOutlet weak var CongratulationsLabel: UILabel!
    
    @IBOutlet weak var CongratulationsDescriptionLabel: UILabel!
    
    @IBOutlet weak var CongratulationsCaloriesLabel: UILabel!
    
    @IBOutlet weak var SocialMediaShareButton: UIButton!
    
    @IBOutlet weak var GoToHomeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parabensTrofeuImage.image = UIImage(named: "parabensTrofeuImage")
        
        // Hide Back Button from UINavigationItem
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }

    @IBAction func tappedSocialMediaButton(_ sender: UIButton) {
        let share = UIActivityViewController(activityItems: ["YogaZone.com"], applicationActivities: nil)
        share.popoverPresentationController?.sourceView = self.view
            self.present(share, animated: true, completion: nil)

    }
    
    @IBAction func tappedGoToHomeButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
