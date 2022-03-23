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
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
        
        //Deveria voltar para a home de eventos, porem o botao voltar deveria retornar para a home:
        //let storyboard = UIStoryboard(name: "HomeEvents", bundle: nil)
        //let vc = storyboard.instantiateViewController(identifier: "HomeEventsViewController")
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: UI Functions
extension EventCreatedSuccessViewController {
    func setupUI(){
        self.titleLabel.text = self.titleText
        self.sucessMessageLabel.text = self.sucessMessage
        self.confirmButton.setTitle("OK", for: .normal)
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
}
