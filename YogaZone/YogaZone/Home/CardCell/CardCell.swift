import UIKit

class CardCell: UICollectionViewCell {
    static let identifier: String = "ColorCubeCell"
    var destination: UIViewController? = nil
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
        imageView.frame = contentView.bounds
        imageView.layer.cornerRadius = 9
    }
    
    func setupCell(imageName: String, destination: UIViewController) {
        self.destination = destination
        self.navController = UINavigationController(rootViewController: destination)
        imageView.image = UIImage(named: imageName)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onTap))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        
        
        self.contentView.clipsToBounds = true
    }
    
    @objc func onTap() {
        self.navigateTo()
    }
    
    func navigateTo() {
        self.navController?.pushViewController(self.destination ?? UIViewController(), animated: true)
    }
    
}
