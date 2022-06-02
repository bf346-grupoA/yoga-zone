//
//  ImcController.swift
//  YogaZone
//
//  Created by Marcelo Silva on 19/02/22.
//

import UIKit

class ImcController: UIViewController {

    @IBOutlet weak var btnCalcular: UIButton!
  
    @IBOutlet weak var butnVerMeuProgesso: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }

    @IBAction func tappedCalcular(_ sender: UIButton) {
        let vc = ResultadoController()
        present(vc, animated: true, completion: nil)
        
        
    }
    @IBAction func tappedVerMeuProgresso(_ sender: UIButton) {
        let vc2 = HistoricoController()
        present(vc2, animated: true, completion: nil)
        
        
        
        
//        let navController = UINavigationController(rootViewController: HistoricoController())
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
