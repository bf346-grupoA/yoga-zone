//
//  UserLevelVC.swift
//  YogaZone
//
//  Created by Marcus on 14/03/22.
//

import UIKit

class UserLevelVC: UIViewController, UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var BeginnerBtn: UIButton!
    
    @IBOutlet weak var LowExperienceBtn: UIButton!
    
    @IBOutlet weak var IntermediateBtn: UIButton!
    
    @IBOutlet weak var GuruBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configLvlButtons()
        configLabels()
    }
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4784313725, green: 0.4784313725, blue: 0.4784313725, alpha: 1)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    func configLvlButtons(){
        var containerTitle = AttributeContainer()
        containerTitle.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        
        var containerSubTitle = AttributeContainer()
        containerSubTitle.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 14)
        
        
        var configBeginner = UIButton.Configuration.filled()
        configBeginner.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        configBeginner.baseForegroundColor = .white
        configBeginner.attributedTitle = AttributedString(OnboardingConstants.starterLevel.rawValue, attributes: containerTitle)
        configBeginner.attributedSubtitle = AttributedString(OnboardingConstants.starterLevelDescription.rawValue, attributes: containerSubTitle)
        configBeginner.titleAlignment = .center
        configBeginner.titlePadding = 4.0
        
        var configLow = UIButton.Configuration.filled()
        configLow.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        configLow.baseForegroundColor = .white
        configLow.attributedTitle = AttributedString(OnboardingConstants.someExperienceLevel.rawValue, attributes: containerTitle)
        configLow.attributedSubtitle = AttributedString(OnboardingConstants.someExperienceLevelDescription.rawValue, attributes: containerSubTitle)
        configLow.titleAlignment = .center
        configLow.titlePadding = 4.0
        
        var configIntermetiate = UIButton.Configuration.filled()
        configIntermetiate.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        configIntermetiate.baseForegroundColor = .white
        configIntermetiate.attributedTitle = AttributedString(OnboardingConstants.intermediateLevel.rawValue, attributes: containerTitle)
        configIntermetiate.attributedSubtitle = AttributedString(OnboardingConstants.intermediateLevelDescription.rawValue, attributes: containerSubTitle)
        configIntermetiate.titleAlignment = .center
        configIntermetiate.titlePadding = 4.0
        
        var configGuru = UIButton.Configuration.filled()
        configGuru.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        configGuru.baseForegroundColor = .white
        configGuru.attributedTitle = AttributedString(OnboardingConstants.guruLevel.rawValue, attributes: containerTitle)
        configGuru.attributedSubtitle = AttributedString(OnboardingConstants.guruLevelDescription.rawValue, attributes: containerSubTitle)
        configGuru.titleAlignment = .center
        configGuru.titlePadding = 4.0
        
        self.BeginnerBtn.configuration = configBeginner
        self.BeginnerBtn.layer.cornerRadius = 8
        self.LowExperienceBtn.configuration = configLow
        self.LowExperienceBtn.layer.cornerRadius = 8
        self.IntermediateBtn.configuration = configIntermetiate
        self.IntermediateBtn.layer.cornerRadius = 8
        self.GuruBtn.configuration = configGuru
        self.GuruBtn.layer.cornerRadius = 8
    }
    
    func configLabels(){
        self.titleLabel.font = UIFont(name: CommonConstants.comfortaaBoldFont.rawValue, size: 16)
        self.titleLabel.textAlignment = .center
    }
    
    func tappedLevelButton(){
        self.navigationController?.pushViewController(MoreInfoRegisterVC(), animated: true)
    }
    
    @IBAction func tappedBeginnerButton(_ sender: UIButton) {
        self.tappedLevelButton()
    }
    
    @IBAction func tappedLowExperienceButton(_ sender: UIButton) {
        self.tappedLevelButton()
    }
    
    @IBAction func tappedMediumExperienceButton(_ sender: UIButton) {
        self.tappedLevelButton()
    }
    
    @IBAction func tappedGuruButton(_ sender: UIButton) {
        self.tappedLevelButton()
    }
}
