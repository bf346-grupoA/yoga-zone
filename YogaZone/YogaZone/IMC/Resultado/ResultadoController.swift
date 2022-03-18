//
//  ResultadoController.swift
//  YogaZone
//
//  Created by Marcelo Silva on 19/02/22.
//

import UIKit

class ResultadoController: UIViewController {
    
    var resultado : Result? = nil

    @IBOutlet weak var healthStatus: UILabel!
    
    @IBOutlet weak var titlePossibleConsequences: UILabel!
    
    @IBOutlet weak var possibleConsequence: UILabel!
    @IBOutlet weak var labelResultado: UILabel!
   
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print(resultado?.possibleConsequences ?? "nao chegou ainda")
        setupUI()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeButton(_ sender: Any){

        dismiss(animated: true)
     
    }
    
    
  
}

extension ResultadoController{
    
    func setupUI(){
        self.labelResultado.text = String(resultado?.imcNumber?.rounded(toPlaces: 1) ?? 0)
        self.labelResultado.textColor = getColor(colorIndex: resultado?.imcIndex?.rawValue ?? 0)
        self.healthStatus.text = resultado?.healthStatus?.rawValue ?? ""
        self.healthStatus.textColor = getColor(colorIndex: resultado?.imcIndex?.rawValue ?? 0)
        self.possibleConsequence.text = resultado?.possibleConsequences?.rawValue ?? ""
        
    }
 
    func getColor(colorIndex:Int) -> UIColor{
        let colours : [Int:UIColor] = [
            1 : .blue,
            2 : .green,
            3 : .orange,
            4 : .red
        ]
        
        
        return colours[colorIndex] ?? .black
    }
    
    
    
    
    
}

