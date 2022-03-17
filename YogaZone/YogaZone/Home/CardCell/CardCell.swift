import UIKit

class CardCell: UICollectionViewCell {
    static let identifier: String = "ColorCubeCell"
    
    public var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
        imageView.layer.cornerRadius = 9
    }
    
    func setupCell(imageName: String) {
        imageView.image = UIImage(named: imageName)
        self.contentView.clipsToBounds = true
    }
    
    
}
