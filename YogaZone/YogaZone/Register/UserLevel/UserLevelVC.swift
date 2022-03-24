//
//  UserLevelVC.swift
//  YogaZone
//
//  Created by Marcus on 14/03/22.
//

import UIKit

class UserLevelVC: UIViewController {
    
    @IBOutlet weak var tappedArrowVoltarImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var BeginnerBtn: UIButton!
    
    @IBOutlet weak var LowExperienceBtn: UIButton!
    
    @IBOutlet weak var IntermediateBtn: UIButton!
    
    @IBOutlet weak var GuruBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configImages()
        configBackButton()
        configButtonsAndLabelsApperance()
        
    }
    
    
    func configImages(){
            tappedArrowVoltarImage.image = UIImage(named: "arrowVoltarCinza")
        
            // Hide Back Button from UINavigationItem
                self.navigationItem.setHidesBackButton(true, animated: true)
        }
    
    private func configBackButton(){
        let tapBackButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedBackButton))
        self.tappedArrowVoltarImage.addGestureRecognizer(tapBackButton)
        self.tappedArrowVoltarImage.isUserInteractionEnabled = true
        
    }
    
    @objc func tappedBackButton(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func configButtonsAndLabelsApperance(){
        BeginnerBtn.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
        BeginnerBtn.subtitleLabel?.font = UIFont(name: "Montserrat-Regular", size: 10)
        BeginnerBtn.clipsToBounds = true // Rounded 🙂
        BeginnerBtn.layer.cornerRadius = 7.5
        
        IntermediateBtn.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
        IntermediateBtn.subtitleLabel?.font = UIFont(name: "Montserrat-Regular", size: 10)
        IntermediateBtn.clipsToBounds = true // Rounded 🙂
        IntermediateBtn.layer.cornerRadius = 7.5
        
        LowExperienceBtn.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
        LowExperienceBtn.subtitleLabel?.font = UIFont(name: "Montserrat-Regular", size: 10)
        LowExperienceBtn.clipsToBounds = true // Rounded 🙂
        LowExperienceBtn.layer.cornerRadius = 7.5
        
        GuruBtn.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
        GuruBtn.subtitleLabel?.font = UIFont(name: "Montserrat-Regular", size: 10)
        GuruBtn.clipsToBounds = true // Rounded 🙂
        GuruBtn.layer.cornerRadius = 7.5

        titleLabel.font = UIFont(name: "Montserrat-Regular", size: 17.0)
    
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
    
    
