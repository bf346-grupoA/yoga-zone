//
//  HomeViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 23/03/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import Firebase

class HomeViewController: UIViewController {
    // MARK: Private Parameters
    private let database = Firestore.firestore()
    private var alert: AlertController?
    private var loggedUser: UserInfo?
    private var viewModel: HomeViewModel?
    
    @IBOutlet weak var menuTableView: UITableView!
    
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.alert = AlertController(controller: self)
        self.viewModel = HomeViewModel()
        self.requestUserInfo()
//        self.setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
}

// MARK: UI Setup
extension HomeViewController {
    func setupTableView() {
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        self.menuTableView.showsVerticalScrollIndicator = false
        self.menuTableView.separatorStyle = .none
        self.menuTableView.backgroundColor = .clear
        self.menuTableView.register(HeaderCell.getNib(), forCellReuseIdentifier: HeaderCell.identifier)
        self.menuTableView.register(CardMenuCell.self, forCellReuseIdentifier: CardMenuCell.identifier)
    }
}

// MARK: TableView Delegate & DataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let headerCell = self.menuTableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell
            headerCell?.delegate = self
            
            
            headerCell?.setupCell(userInfo: self.loggedUser ?? UserInfo(username: "Usuário", avatar: nil))
            
            return headerCell ?? UITableViewCell()
            
        default:
            let menuCell = self.menuTableView.dequeueReusableCell(withIdentifier: CardMenuCell.identifier, for: indexPath) as? CardMenuCell
            menuCell?.delegate = self
            menuCell?.awakeFromNib()
            
            return menuCell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 90
        default: return self.view.frame.height
        }
    }
    
}

// MARK: Navigation
extension HomeViewController: NavigationDelegate {
    func navigateTo(routeIndex: Int) {
        switch routeIndex {
        case 1: self.navigationController?.pushViewController(PoseGalleryViewController(), animated: true)
        case 2: initializeStoryboard(withName: "Bmi", withIdentifier: "BmiViewController")
        case 3: self.navigationController?.pushViewController(LevelAndDurationVC(), animated: true)
        case 4: self.navigationController?.pushViewController(IntroViewController(), animated: true)
        case 5: initializeStoryboard(withName: "HomeEvents", withIdentifier: "HomeEventsViewController")
        case 6: initializeStoryboard(withName: "HomeEvents", withIdentifier: "HomeEventsViewController")
        default: self.navigationController?.pushViewController(MyProfileVC(), animated: true)
        }
    }
    
    
    private func initializeStoryboard(withName name: String, withIdentifier identifier: String) {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        self.navigationController?.pushViewController(storyboard.instantiateViewController(identifier: identifier), animated: true)
    }
}

// MARK: AlertController
extension HomeViewController {
    private func notifyUser(withTitle title: String, withMessage message: String) {
        self.alert?.setup(
            title: title,
            message: message
        )
    }
}

// MARK: User Profile
extension HomeViewController {

    private func requestUserInfo() {
        self.viewModel?.requestUserInfo { result in
            switch result {
                case .success(let userInfo):
                    self.handleSuccess(with: userInfo)
                case .failure(let error):
                    guard let yzError = error as? YZError else {
                        self.notifyUser(withTitle: "Deu Ruim ein =(", withMessage: "Info de Usuário não encontrada =(")
                        return
                    }
                        
                    self.handleError(with: yzError)
            }
        }
    }
    
    private func handleSuccess(with response: UserInfo) {
        self.loggedUser = self.viewModel?.getUserInfo()
        setupTableView()
    }
    
    private func handleError(with error: YZError) {
        self.loggedUser = self.viewModel?.getUserInfo()
        setupTableView()
        self.notifyUser(withTitle: "Deu Ruim ein =(", withMessage: error.localizedDescription)
    }
    
}
