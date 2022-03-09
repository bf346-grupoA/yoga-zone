import UIKit

private let reuseIdentifier = "AudioCell"

class HomeViewController: UIViewController {
    
    @IBOutlet weak var meditationTableView: UITableView!
    
    var meditationFiles: [MeditationAudioFile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.meditationTableView.delegate = self
        self.meditationTableView.dataSource = self
        
        setupUI()
    }
}
// MARK: UI Functions
extension HomeViewController {
    func setupUI() {
        
        let nibCell = UINib(nibName: reuseIdentifier, bundle: nil)
        self.meditationTableView.register(nibCell, forCellReuseIdentifier: reuseIdentifier)
        self.meditationTableView.separatorColor = .clear
        
        for m in 1...30 {
            let meditationFile = MeditationAudioFile(title: "Meditation File - \(m)", image: #imageLiteral(resourceName: "medicacao-select"))
            meditationFiles.append(meditationFile)
        }
        
        meditationTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in TableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meditationFiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meditationFile = meditationFiles[indexPath.row]
        
        let cell = meditationTableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? AudioCell
        cell?.titleLabel.text = meditationFile.title
        cell?.selectButtonImage.image = #imageLiteral(resourceName: "medicacao-select")
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFile = meditationFiles[indexPath.row]
        let vc = PracticeViewController(nibName: "PracticeViewController", bundle: nil)
        vc.selectedFile = selectedFile.title
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
