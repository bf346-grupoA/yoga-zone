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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configImages()
        configBackButton()
        
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
    
    
