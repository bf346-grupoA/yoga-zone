import UIKit

class AudioCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectButtonImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func setupCell(meditationFile: MeditationAudioFile) {
        self.titleLabel.text = meditationFile.title
        self.selectButtonImage.image = #imageLiteral(resourceName: "medicacao-select")
    }
    
}


// MARK: Static properties & methods
extension AudioCell {
    static let identifier: String = "AudioCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
