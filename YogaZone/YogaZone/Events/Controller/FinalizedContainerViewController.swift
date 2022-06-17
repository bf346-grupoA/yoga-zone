//
//  FinalizedContainerViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 15/03/22.
//

import UIKit

class FinalizedContainerViewController:UIViewController {
    
    @IBOutlet weak var finalizedLabel: UILabel!
    
    var text:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
}

// MARK: UI Functions
extension FinalizedContainerViewController {
    func setupUI(){
        self.finalizedLabel.text = self.text
        self.finalizedLabel.textColor = #colorLiteral(red: 0.831372549, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
        self.finalizedLabel.layer.backgroundColor = #colorLiteral(red: 0.7843137255, green: 0.7607843137, blue: 0.7607843137, alpha: 0.2978580298)
    }
    
    func setLabelText(text:String){
        self.text = text
    }
    
}


