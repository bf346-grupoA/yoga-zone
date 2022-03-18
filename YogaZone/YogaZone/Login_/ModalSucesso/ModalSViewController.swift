//
//  modalSViewController.swift
//  YogaZone
//
//  Created by Marcelo Silva on 17/03/22.
//

import UIKit

class ModalSViewController: UIViewController {

    @IBOutlet weak var viewControllerMOdal: UIView!
    
    @IBOutlet weak var buttonLabel: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.viewControllerMOdal.layer.cornerRadius = 
//        self.buttonLabel.layer.cornerRadius =
        
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedOkButton(_ sender: Any) {
        let _: Void = show(telaaLoginViewController(), sender:UIViewController().self)
        
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
