//
//  HomeHeader.swift
//  IOSAcademy_CollectionCompositeLayout
//
//  Created by Philippe Muniz Gomes on 17/03/22.
//

import Foundation
import UIKit

class HomeHeader: UIView {
    let headerSize: CGFloat = 130
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension HomeHeader {
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .init(red: 94, green: 76, blue: 132, alpha: 0)
//        self.layer.cornerRadius = 8
        self.frame.size.width = UIScreen.main.bounds.width
        self.frame.size.height = headerSize
                
        let profileImage: UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.image =  #imageLiteral(resourceName: "profile")
            image.contentMode = .scaleToFill
            image.layer.cornerRadius = 40
            image.layer.masksToBounds = true
            
            return image
        }()
        
        let greetingLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 20)
            label.textColor = .black
            
            return label
        }()
        
        addSubview(greetingLabel)
        addSubview(profileImage)
        
        
        
        greetingLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        greetingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        greetingLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        greetingLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        profileImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: headerSize)
    }
}

