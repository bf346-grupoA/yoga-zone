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
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(resultado?.possibleConsequences ?? "nao chegou ainda")
        setupUI()
        view.backgroundColor = .white
        self.saveButton.layer.cornerRadius = 8
    }

    @IBAction func closeButton(_ sender: Any){

        dismiss(animated: true)
     
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let vc4 = tappedSaveResultViewController()
        vc4.message = "Resultado Salvo!"
        vc4.modalTransitionStyle = .crossDissolve
        vc4.modalPresentationStyle = .overFullScreen
        present(vc4, animated: false, completion: nil)
        
    }
    
  
}

extension ResultadoController{
    
    func setupUI(){
        self.labelResultado.text = String(resultado?.imcNumber?.rounded(toPlaces: 1) ?? 0)
        self.labelResultado.textColor = getColor(colorIndex: resultado?.imcIndex?.rawValue ?? 0)
        self.healthStatus.text = resultado?.healthStatus?.rawValue ?? ""
        self.healthStatus.textColor = getColor(colorIndex: resultado?.imcIndex?.rawValue ?? 0)
        self.possibleConsequence.text = resultado?.possibleConsequences?.rawValue ?? ""
        self.possibleConsequence.textColor = getColor(colorIndex: resultado?.imcIndex?.rawValue ?? 0)
        
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

