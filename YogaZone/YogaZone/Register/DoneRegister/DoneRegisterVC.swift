//
//  DoneRegisterVC.swift
//  YogaZone
//
//  Created by Marcus on 16/03/22.
//

import UIKit

class DoneRegisterVC: UIViewController {

    @IBOutlet weak var smileEmojiImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configImages()

    }

    func configImages(){
        
        smileEmojiImage.image = UIImage(named: "smile_emoji")
        // Hide Back Button from UINavigationItem
            self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func tappedGoToHome(_ sender: UIButton) {
//        self.navigationController?.pushViewController(HomeVC(), animated: true)
    }
    
}
  
