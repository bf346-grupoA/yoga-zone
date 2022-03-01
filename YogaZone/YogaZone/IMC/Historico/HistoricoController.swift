//
//  HistoricoController.swift
//  YogaZone
//
//  Created by Marcelo Silva on 19/02/22.
//

import UIKit

class HistoricoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedShare(_ sender: Any) {
    let VcShare = UIActivityViewController(activityItems: ["ŸogaZone.com"], applicationActivities: nil)
        VcShare.popoverPresentationController?.sourceView = self.view
        self.present(VcShare, animated: true, completion: nil)
        
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
