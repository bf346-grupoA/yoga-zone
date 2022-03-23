//
//  EventCreatedSuccessViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 22/02/22.
//

import UIKit

class EventCreatedSuccessViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sucessMessageLabel: UITextView!
    @IBOutlet weak var confirmButton: UIButton!
    
    var titleText = ""
    var sucessMessage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "HomeEvents", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "HomeEventsViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: UI Functions
extension EventCreatedSuccessViewController {
    func setupUI(){
        self.titleLabel.text = self.titleText
        self.sucessMessageLabel.text = self.sucessMessage
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        self.confirmButton.configuration = nil
        self.confirmButton.setTitle("OK", for: .normal)
        self.confirmButton.setTitleColor(.white, for: .normal)
        self.confirmButton.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.confirmButton.backgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        self.confirmButton.layer.cornerRadius = 8
    }
    
}
