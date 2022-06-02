//
//  HistoricoController.swift
//  YogaZone
//
//  Created by Marcelo Silva on 19/02/22.
//

import UIKit

class HistoricoController: UIViewController {

    @IBOutlet weak var meuProgresso: UILabel!
    @IBOutlet weak var pesoAtual: UILabel!
    @IBOutlet weak var obejtivo: UILabel!
    @IBOutlet weak var faltam: UILabel!
    @IBOutlet weak var resultadoPesoAtual: UILabel!
    @IBOutlet weak var ResultadoObjetivo: UILabel!
    @IBOutlet weak var ResultadoFaltam: UILabel!
    @IBOutlet weak var kgPesoAtual: UILabel!
    
    @IBOutlet weak var KgObjetivo: UILabel!
    @IBOutlet weak var kgFaltam: UILabel!
    @IBOutlet weak var Data: UILabel!
    @IBOutlet weak var Resultado: UILabel!
    @IBOutlet weak var peso: UILabel!
    @IBOutlet weak var faltamLabel2: UILabel!
    @IBOutlet weak var buttonCompartilhar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedCompartilhar(_ sender: Any) {
        
        
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
