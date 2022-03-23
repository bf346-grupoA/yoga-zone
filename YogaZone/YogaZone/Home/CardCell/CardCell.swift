import UIKit

class CardCell: UICollectionViewCell {
    weak var delegate: Selectable?
    
    static let identifier: String = "ColorCubeCell"
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
    
    func setupCell(imageName: String, destinationIndex: Int) {
//        self.destination = destination
        self.destinationIndex = destinationIndex
//        self.navController = UINavigationController(rootViewController: Router.getDestinationByIndex(index: self.destinationIndex ?? 0))
        self.navController = UINavigationController(rootViewController: HomeViewController())
        imageView.image = UIImage(named: imageName)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onTap))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        
        
        self.contentView.clipsToBounds = true
    }
    
    @objc func onTap() {
        self.delegate?.navigateTo(routeIndex: self.destinationIndex ?? 0)
    }

}
