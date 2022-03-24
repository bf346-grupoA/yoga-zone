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
    @IBOutlet weak var textFieldObjetivo: UITextField!
    @IBOutlet weak var seeMyProgress: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.alturaLabel.delegate = self
//        self.pesoLabel.delegate = self
        self.alturaLabel.textAlignment = .center
        self.pesoLabel.textAlignment = .center
        self.btnCalcular.layer.cornerRadius = 8
        self.seeMyProgress.layer.cornerRadius = 8
        self.alturaLabel.keyboardType = UIKeyboardType.numberPad
        self.pesoLabel.keyboardType = UIKeyboardType.numberPad
        self.textFieldObjetivo.keyboardType = UIKeyboardType.numberPad
}

                                                           
                                                           
                                                           
    @IBAction func tappedCalcular(_ sender: UIButton) {
        
        let result = calcularResultado()
        
        let vc = ResultadoController()
        vc.resultado = result
        present(vc, animated: true, completion: nil)
      

    }
    @IBAction func tapeedVermeuHistorico(_ sender: Any) {
        show(HistoricoController(), sender:UIViewController().self)
     }
         
    
    @IBAction func tappedSwitchOb(_ sender: Any) {
        let vc4 = tappedSaveResultViewController()
        vc4.message = "Objetivo Salvo!"
        vc4.modalTransitionStyle = .crossDissolve
        vc4.modalPresentationStyle = .overFullScreen
        present(vc4, animated: false, completion: nil)
        
        
    }
    
    
}


extension ImcController {
    func calcularResultado() -> Result {
        
        var height = Double(self.alturaLabel.text ?? "0") ?? 0
        let weigth = Double(self.pesoLabel.text ?? "0") ?? 0
        height = height / 100
        
        let imc =  weigth / (height * height)
        
       
        var result = Result()
        
        
        if imc <= ImcNumber.magreza.rawValue{
            result.healthStatus = .magreza
            result.possibleConsequences = .magreza
            result.imcIndex = .IndexMgreza
            result.imcNumber = imc
        }else if(imc >= ImcNumber.saudavelMinimum.rawValue && imc <= ImcNumber.saudavelMaximum.rawValue) {
            result.healthStatus = .saudavel
            result.possibleConsequences = .saudavel
            result.imcIndex = .IndexSaudadel
            result.imcNumber = imc
            
        }else if(imc >= ImcNumber.sobrepesoMinimum.rawValue && imc <= ImcNumber.sobrepesoMaximum.rawValue){
            result.healthStatus = .sobrepeso
            result.possibleConsequences = .sobrepeso
            result.imcIndex = .IndexSobrepeso
            result.imcNumber = imc
            
        }else{
            result.healthStatus = .obesidade
            result.possibleConsequences = .obesidade
            result.imcIndex = .IndexObesidade
            result.imcNumber = imc
            
        }
        
        
        return result
    }
    
}
//
//just numbers
//func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        let allowedCharacters = "+1234567890"
//        let allowedCharcterSet = CharacterSet(charactersIn: allowedCharacters)
//        let typedCharcterSet = CharacterSet(charactersIn: string)
//        return allowedCharcterSet.isSuperset(of: typedCharcterSet)
//    }



