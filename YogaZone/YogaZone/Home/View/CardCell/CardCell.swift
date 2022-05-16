import UIKit

class CardCell: UICollectionViewCell {
    static let identifier: String = "CardCell"
    var destination: UIViewController? = nil
    var destinationIndex: Int? = nil
    var navController: UINavigationController? = nil
    
    var imageView: UIImageView = {
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
        self.imageView.frame = contentView.bounds
        self.imageView.layer.cornerRadius = 9
        self.imageView.contentMode = .scaleToFill
        
    }
}


// MARK: UI
extension CardCell {
    func setupCell(imageName: String, destinationIndex: Int) {
        self.destinationIndex = destinationIndex
        self.navController = UINavigationController(rootViewController: HomeViewController())
        imageView.image = UIImage(named: imageName)
        
        self.contentView.clipsToBounds = true
    }
}
