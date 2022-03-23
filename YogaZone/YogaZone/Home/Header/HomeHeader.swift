//
//  HomeHeader.swift
//  IOSAcademy_CollectionCompositeLayout
//
//  Created by Philippe Muniz Gomes on 17/03/22.
//

import Foundation
import UIKit

class HomeHeader: UIView {
    weak var delegate: Selectable?
    let headerSize: CGFloat = 180
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = .init(red: 65/255, green: 11/255, blue: 127/255, alpha: 1.0)
    }
    
    @objc func onTapProfile() {
        self.delegate?.navigateTo(routeIndex: 6)
    }
}

extension HomeHeader {
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame.size.width = UIScreen.main.bounds.width
        self.frame.size.height = headerSize
                
        var profileImage: UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.image =  #imageLiteral(resourceName: "profile")
            image.contentMode = .scaleToFill
            image.layer.cornerRadius = 28
            image.layer.masksToBounds = true
            
            return image
        }()
        
        let greetingLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: "Montserrat-Regular", size: 20)
            label.textColor = .white
            label.text = "Namastê, Ricardo"
            label.numberOfLines = 0
            
            return label
        }()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onTapProfile))
        profileImage.addGestureRecognizer(tapGesture)
        profileImage.isUserInteractionEnabled = true
        
        addSubview(greetingLabel)
        addSubview(profileImage)
        
        
        greetingLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        greetingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        greetingLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        greetingLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        profileImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 55).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: headerSize)
    }
}

