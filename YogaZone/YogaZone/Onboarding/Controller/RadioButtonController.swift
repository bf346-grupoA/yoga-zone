//
//  File.swift
//  YogaZone
//
//  Created by Marcus on 16/03/22.
//

import UIKit

class RadioButtonController: NSObject {
    var buttonsArray: [UIButton]! {
        didSet {
            for b in buttonsArray {
                b.setImage(UIImage(named: OnboardingConstants.radioOff.rawValue), for: .normal)
                b.setImage(UIImage(named: OnboardingConstants.radioOn.rawValue), for: .selected)
            }
        }
    }
    
    var selectedButton: UIButton?
    var defaultButton: UIButton = UIButton() {
        didSet {
            buttonArrayUpdated(buttonSelected: self.defaultButton)
        }
    }

    func buttonArrayUpdated(buttonSelected: UIButton) {
        for b in buttonsArray {
            if b == buttonSelected {
                selectedButton = b
                b.isSelected = true
            } else {
                b.isSelected = false
            }
        }
    }
}
