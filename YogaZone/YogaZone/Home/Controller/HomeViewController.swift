//
//  HomeViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 23/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true);
        self.view.backgroundColor = .white
        self.setupTableView()
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
            case 2:
            let storyboard = UIStoryboard(name: "Bmi", bundle: nil)
            self.navigationController?.pushViewController(storyboard.instantiateViewController(identifier: "BmiViewController"), animated: true)
            case 3: self.navigationController?.pushViewController(BreathingHomeViewController(), animated: true)
            case 4: self.navigationController?.pushViewController(IntroViewController(), animated: true)
            case 5: self.navigationController?.pushViewController(LevelAndDurationVC(), animated: true)
            case 6:
                let storyboard = UIStoryboard(name: "HomeEvents", bundle: nil)
                self.navigationController?.pushViewController(storyboard.instantiateViewController(identifier: "HomeEventsViewController"), animated: true)
            default: self.navigationController?.pushViewController(MyProfileVC(), animated: true)
        }
    }
}
