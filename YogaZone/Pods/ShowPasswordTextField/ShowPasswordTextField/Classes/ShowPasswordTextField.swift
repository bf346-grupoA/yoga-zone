//
//  ShowPasswordTextField.swift
//  Pods-ShowPasswordTextField_Example
//
//  Created by Karim Angama on 15/02/2022.
//

import Foundation
import UIKit

@IBDesignable
open class ShowPasswordTextField: UITextField {
    
    private var button = UIButton(type: .custom)
    private var configuration: UIImage.Configuration?
    
    @IBInspectable
    open var sizeIcon: CGFloat = 24 {
        didSet {
            setupImage()
        }
    }
    
    @IBInspectable
    open var tintIconColor: UIColor = UIColor.systemGray {
        didSet {
            self.button.tintColor = tintIconColor
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupPasswordButton()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupPasswordButton()
    }
    
    public override func prepareForInterfaceBuilder() {
        setupPasswordButton()
    }
    
    private func setupPasswordButton() {
        
        isSecureTextEntry = true
        setupImage()
        self.button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.button.tintColor = tintIconColor
        self.button.clipsToBounds = true
        self.rightView = self.button
        self.rightView?.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        self.rightViewMode = .always
        self.button.addTarget(self, action: #selector(self.enablePasswordVisibilityToggle), for: .touchUpInside)

    }
    
    private func setupImage() {
        self.configuration = UIImage.SymbolConfiguration(
            pointSize: sizeIcon,
            weight: .regular,
            scale:.large
        )
        self.button.setImage(UIImage(
            systemName: "eye.slash",
            withConfiguration: configuration
        ), for: .normal)
    }
    
    @objc private func enablePasswordVisibilityToggle() {
        isSecureTextEntry.toggle()
        if isSecureTextEntry {
            self.button.setImage(UIImage(
                systemName: "eye.slash",
                withConfiguration: configuration
            ), for: .normal)
        }else{
            self.button.setImage(UIImage(
                systemName: "eye",
                withConfiguration: configuration
            ), for: .normal)
        }
    }
}
