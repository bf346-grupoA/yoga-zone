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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
