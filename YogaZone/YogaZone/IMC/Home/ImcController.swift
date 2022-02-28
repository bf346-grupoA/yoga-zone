//
//  ImcController.swift
//  YogaZone
//
//  Created by Marcelo Silva on 19/02/22.
//

import UIKit

class ImcController: UIViewController {

    @IBOutlet weak var btnCalcular: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }

    @IBAction func tappedCalcular(_ sender: UIButton) {
        let vc = ResultadoController()
        present(vc, animated: true, completion: nil)
        
        
    }
    
}
