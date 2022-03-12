//
//  MeuPerfilTableViewCell.swift
//  YogaZone
//
//  Created by Marcus on 12/03/22.
//

import UIKit

class MeuPerfilTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var meuPerfilTitleCellLabel: UILabel!
    
    @IBOutlet weak var meuPerfilTitleCellTextField: UITextField!
    
    
    static let identifier:String = "MeuPerfilTableViewCell"
    
    static func nib()-> UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.meuPerfilTitleCellTextField.setupRightImage(imageName: "editIcon")
    }
}


extension UITextField {
    func setupRightImage(imageName:String){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
        imageContainerView.addSubview(imageView)
        rightView = imageContainerView
        rightViewMode = .always
    }
}




