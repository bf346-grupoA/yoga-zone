//
//  MockAppHomeViewController.swift
//  YogaZone
//
//  Created by Rafael Benjamin on 28/02/22.
//

import UIKit

class MockAppHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedButton(_ sender: Any) {
        //let storyboard = UIStoryboard(name: "HomeEvents", bundle: nil)
        //let vc = storyboard.instantiateViewController(identifier: "HomeEventsViewController")
        
        let storyboard = UIStoryboard(name: "HomeEvents", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "HomeEventsViewController")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
