//
//  ResultadoController.swift
//  YogaZone
//
//  Created by Marcelo Silva on 19/02/22.
//

import UIKit

class ResultadoController: UIViewController {

    @IBOutlet weak var labelResultado: UILabel!
    
    @IBOutlet weak var labelPesoIdeal: UILabel!
    
    @IBOutlet weak var labelResultado2: UILabel!
   
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelResultado2.text = String(format: "")

      
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
    }

    @IBAction func closeButton(_ sender: Any){

        dismiss(animated: true)
     
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
