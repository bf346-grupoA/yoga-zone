//
//  ImcController.swift
//  YogaZone
//
//  Created by Marcelo Silva on 19/02/22.
//

import UIKit

class ImcController: UIViewController{

    @IBOutlet weak var btnCalcular: UIButton!
    @IBOutlet weak var SwitchSalvarOb: UISwitch!
    
    @IBOutlet weak var pesoLabel: UITextField!
    
    @IBOutlet weak var alturaLabel: UITextField!
    
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }

    @IBAction func tappedCalcular(_ sender: UIButton) {
        let vc = ResultadoController()
        present(vc, animated: true, completion: nil)
      

    }
    @IBAction func tapeedVermeuHistorico(_ sender: Any) {
        show(HistoricoController(), sender:UIViewController().self)
     }
         
    
    @IBAction func tappedSwitchOb(_ sender: Any) {
        let vc3 = TapeedSwitchObViewController();present(vc3, animated: false, completion: nil)
    }
    
    
}

