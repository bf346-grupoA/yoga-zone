//
//  DoneRegisterVC.swift
//  YogaZone
//
//  Created by Marcus on 16/03/22.
//

import UIKit

class DoneRegisterVC: UIViewController {

    @IBOutlet weak var smileEmojiImage: UIImageView!
    
    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var thirdLabel: UILabel!
    
    @IBOutlet weak var startBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configImages()
        configButtonsAndLabelsApperance()

    }
    
    func configButtonsAndLabelsApperance(){
        startBtn.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
        startBtn.clipsToBounds = true // Rounded 🙂
        startBtn.layer.cornerRadius = 7.5
        firstLabel.font = UIFont(name: "Montserrat-Bold", size: 17.0)
        secondLabel.font = UIFont(name: "Montserrat-Regular", size: 17.0)
        thirdLabel.font = UIFont(name: "Montserrat-Regular", size: 17.0)
    }

    func configImages(){
        
        smileEmojiImage.image = UIImage(named: "smile_emoji")
        // Hide Back Button from UINavigationItem
            self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func tappedGoToHome(_ sender: UIButton) {
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
}
  
