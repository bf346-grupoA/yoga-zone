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
        containerTitle.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        config.baseForegroundColor = .white
        config.attributedTitle = AttributedString(OnboardingConstants.start.rawValue, attributes: containerTitle)
        
        self.startBtn.configuration = config
        self.startBtn.layer.cornerRadius = 8
        
    }
    
    @IBAction func tappedGoToHome(_ sender: UIButton) {
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
        self.setNewRootController()
    }
    
    func configLabels(){
        self.firstLabel.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 22)
        self.firstLabel.textAlignment = .center
        self.secondLabel.font = UIFont(name: CommonConstants.comfortaaSemiBoldFont.rawValue, size: 16)
        self.secondLabel.textAlignment = .center
        self.thirdLabel.font = UIFont(name: CommonConstants.comfortaaSemiBoldFont.rawValue, size: 16)
    }
    
    func setupUI(){
        configStartButton()
        configLabels()
    }
    
    func configImages(){
        smileEmojiImage.image = UIImage(named: CommonConstants.smileEmojiText.rawValue)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func setNewRootController(){
        let rootViewController = UINavigationController(rootViewController: HomeViewController())
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        windowScene?.keyWindow?.rootViewController = rootViewController
    }
    
}

