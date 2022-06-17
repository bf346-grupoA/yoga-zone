//
//  TrainingFinishedVC.swift
//  YogaZone
//
//  Created by Marcus on 28/02/22.
//

import UIKit

class TrainingFinishedVC: UIViewController {


    @IBOutlet weak var congratulationsImage: UIImageView!
    @IBOutlet weak var CongratulationsLabel: UILabel!
    @IBOutlet weak var CongratulationsDescriptionLabel: UILabel!
    @IBOutlet weak var CongratulationsCaloriesLabel: UILabel!
    @IBOutlet weak var SocialMediaShareButton: UIButton!
    @IBOutlet weak var GoToHomeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    //MARK: - SetupUI
    func setupImages(){
        self.congratulationsImage.image = UIImage(named: "parabensTrofeuImage")
    }
    
    func configLabels(){
        self.CongratulationsLabel.font = UIFont(name: "Comfortaa-Bold", size: 26)
        self.CongratulationsLabel.textAlignment = .center
        
        self.CongratulationsDescriptionLabel.font = UIFont(name: "Comfortaa-Bold", size: 18)
        self.CongratulationsDescriptionLabel.textAlignment = .center
        
        self.CongratulationsCaloriesLabel.font = UIFont(name: "Comfortaa-Bold", size: 20)
        self.CongratulationsCaloriesLabel.textAlignment = .center
    }
    
    func goToHomeButton(){
        var containerTitle = AttributeContainer()
            containerTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        
        var config = UIButton.Configuration.filled()
            config.baseBackgroundColor = .clear
            config.baseForegroundColor = .black
            config.cornerStyle = .capsule
            config.attributedTitle = AttributedString("Ir para a Home", attributes: containerTitle)
        
        self.GoToHomeButton.configuration = config
    }
    
    func socialMediaShareButton(){
        var containerTitle = AttributeContainer()
            containerTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        
        var config = UIButton.Configuration.filled()
            config.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
            config.baseForegroundColor = .white
            config.attributedTitle = AttributedString("Compartilhar", attributes: containerTitle)
        
        self.SocialMediaShareButton.configuration = config
        self.SocialMediaShareButton.layer.cornerRadius = 8
    }
    
    func setupUI(){
        self.configLabels()
        self.goToHomeButton()
        self.socialMediaShareButton()
        self.setupImages()
        
    }

    @IBAction func tappedSocialMediaButton(_ sender: UIButton) {
        let share = UIActivityViewController(activityItems: ["YogaZone.com"], applicationActivities: nil)
        share.popoverPresentationController?.sourceView = self.view
            self.present(share, animated: true, completion: nil)

    }
    
    @IBAction func tappedGoToHomeButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
}
