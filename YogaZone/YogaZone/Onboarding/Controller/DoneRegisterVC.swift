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
        setupUI()
    }
    
    
    // MARK: SetupUI
    func configStartButton(){
        var containerTitle = AttributeContainer()
            containerTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        
        var config = UIButton.Configuration.filled()
            config.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
            config.baseForegroundColor = .white
            config.attributedTitle = AttributedString("Começar", attributes: containerTitle)
        
        self.startBtn.configuration = config
        self.startBtn.layer.cornerRadius = 8

    }
    
    func configLabels(){
        self.firstLabel.font = UIFont(name: "Comfortaa-Bold", size: 22)
        self.firstLabel.textAlignment = .center
        self.secondLabel.font = UIFont(name: "Comfortaa-SemiBold", size: 16)
        self.secondLabel.textAlignment = .center
        self.thirdLabel.font = UIFont(name: "Comfortaa-SemiBold", size: 16)
    }
    
    func setupUI(){
        configStartButton()
        configLabels()
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
  
