import UIKit

class MeditacaoHomeViewController: UIViewController {
    
    @IBOutlet weak var meditationTableView: UITableView!
    
    var meditationFiles: [MeditationAudioFile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupUI()
    }
}

// MARK: Data Mock
extension MeditacaoHomeViewController {
    func setupData() {
        let jsonData = meditationMock.data(using: .utf8)!
        let meditationData = try! JSONDecoder().decode([MeditationAudioFile].self, from: jsonData)
        meditationData.forEach { self.meditationFiles.append($0)}
    }
}


// MARK: UI Functions
extension MeditacaoHomeViewController {
    func setupUI() {
        self.meditationTableView.delegate = self
        self.meditationTableView.dataSource = self
        self.meditationTableView.register(AudioCell.getNib(), forCellReuseIdentifier: AudioCell.identifier)
        self.meditationTableView.separatorStyle = .none
        self.meditationTableView.showsVerticalScrollIndicator = false
    }
}


// MARK: TableViewDelegate & TableViewDataSource
extension MeditacaoHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in TableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meditationFiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = meditationTableView.dequeueReusableCell(withIdentifier: AudioCell.identifier, for: indexPath) as? AudioCell
        
        let meditationFile = meditationFiles[indexPath.row]
        cell?.setupCell(meditationFile: meditationFile)
        
        cell?.selectionStyle = .none
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 69
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFile = meditationFiles[indexPath.row]
        let vc = PracticeViewController()
        
        vc.selectedFile = selectedFile
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
