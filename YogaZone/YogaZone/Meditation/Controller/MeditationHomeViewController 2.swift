import UIKit

class MeditationHomeViewController: UIViewController {
    
    @IBOutlet weak var meditationTableView: UITableView!
    
    var meditationFiles: [MeditationAudioFile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupUI()
        setupNavigationBar()
    }
}

// MARK: Data Mock
extension MeditationHomeViewController {
    func setupData() {
        do {
            let jsonData = meditationMock.data(using: .utf8)
            let meditationData = try JSONDecoder().decode([MeditationAudioFile].self, from: jsonData ?? Data())
            meditationData.forEach { self.meditationFiles.append($0)}
        } catch {
            print(error)
        }
    }
    
    
}


// MARK: UI Functions
extension MeditationHomeViewController {
    func setupUI() {
        self.meditationTableView.delegate = self
        self.meditationTableView.dataSource = self
        self.meditationTableView.register(AudioCell.getNib(), forCellReuseIdentifier: AudioCell.identifier)
        self.meditationTableView.separatorStyle = .none
        self.meditationTableView.showsVerticalScrollIndicator = false
    }
}


// MARK: TableViewDelegate & TableViewDataSource
extension MeditationHomeViewController: UITableViewDelegate, UITableViewDataSource {
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

// MARK: Navigation Bar Customization
extension MeditationHomeViewController: UIGestureRecognizerDelegate  {
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4784313725, green: 0.4784313725, blue: 0.4784313725, alpha: 1)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "arrowVoltar"),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
    }
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
}
