//
//  TreinoUmController.swift
//  YogaZone
//
//  Created by Marcus on 20/02/22.
//

import UIKit
import SwiftyMenu


class TreinoUmController: UIViewController {
    
 
   
    @IBOutlet weak var dropDownDuration: SwiftyMenu!
    
    @IBOutlet weak var dropDownLevel: SwiftyMenu!
    
    @IBOutlet weak var circleBackground: UIImageView!
    
    @IBOutlet weak var titleTreinoDeYoga: UILabel!
    
    @IBOutlet weak var descriptionTreinoDeYoga: UILabel!
    
    @IBOutlet weak var tappedArrowVoltar: UIImageView!
    
    @IBOutlet weak var timeDurationImage: UIImageView!
    
    @IBOutlet weak var levelExerciceImage: UIImageView!
    
    @IBOutlet weak var timeDurationLabel: UILabel!
    
    @IBOutlet weak var levelExerciceLabel: UILabel!
    
    @IBOutlet weak var seeTrainButton: UIButton!
    
    private let dropDownOptionsDataSourceLevel = ["Iniciante", "Pouco Experiente", "Intermediário","Guru"]
    
    private let dropDownOptionsDataSourceDuration = ["10 min", "15 min", "20 min"]
    
    
    private var storyboardMenuAttributes: SwiftyMenuAttributes {
            var attributes = SwiftyMenuAttributes()

            // Custom Behavior
            attributes.multiSelect = .disabled
            attributes.scroll = .enabled
            attributes.hideOptionsWhenSelect = .enabled

            // Custom UI
            attributes.roundCorners = .all(radius: 8)
            attributes.rowStyle = .value(height: 35, backgroundColor: .white, selectedColor: UIColor.gray.withAlphaComponent(0.1))
            attributes.headerStyle = .value(backgroundColor: .white, height: 35)
            attributes.placeHolderStyle = .value(text: "Escolher", textColor: .lightGray)
            attributes.textStyle = .value(color: .gray, separator: " & ", font: .systemFont(ofSize: 12))
            attributes.separatorStyle = .value(color: .black, isBlured: false, style: .singleLine)
            attributes.arrowStyle = .value(isEnabled: true)
            attributes.height = .value(height: 300)

            // Custom Animations
            attributes.expandingAnimation = .spring(level: .low)
            attributes.expandingTiming = .value(duration: 0.5, delay: 0)
            attributes.collapsingAnimation = .linear
            attributes.collapsingTiming = .value(duration: 0.5, delay: 0)
            return attributes
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStoryboardMenu()
        circleBackground.image = UIImage(named: "circleBackground")
        tappedArrowVoltar.image = UIImage(named: "arrowVoltar")
        timeDurationImage.image = UIImage(named: "timeDuration")
        levelExerciceImage.image = UIImage(named: "levelExercice")
    }
    
    private func setupStoryboardMenu() {
            /// Setup component
        dropDownDuration.delegate = self
        dropDownDuration.items = dropDownOptionsDataSourceDuration

        dropDownLevel.delegate = self
        dropDownLevel.items = dropDownOptionsDataSourceLevel
        
        
            /// Configure SwiftyMenu with the attributes
        dropDownDuration.configure(with: storyboardMenuAttributes)
        dropDownLevel.configure(with: storyboardMenuAttributes)
        }

    
    @IBAction func tappedSeeTrainButton(_ sender: UIButton) {
        let vc = TreinoListagemController()
        present(vc, animated: true, completion: nil)
    }
}

extension TreinoUmController: SwiftyMenuDelegate {
    func swiftyMenu(_ swiftyMenu: SwiftyMenu, didSelectItem item: SwiftyMenuDisplayable, atIndex index: Int) {
        print("Selected item: \(item), at index: \(index)")
    }
    
    func swiftyMenu(willExpand swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu willExpand.")
    }
    
    func swiftyMenu(didExpand swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu didExpand.")
    }
    
    func swiftyMenu(willCollapse swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu willCollapse.")
    }
    
    func swiftyMenu(didCollapse swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu didCollapse.")
    }
    
    //        view.backgroundColor = UIColor(red: 114/255, green: 103/255, blue: 203/255, alpha: 1.0) /* #7267cb */
}
