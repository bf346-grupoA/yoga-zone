//
//  LoginViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }

    
    private func setupTableView() {
        self.loginTableView.delegate = self
        self.loginTableView.dataSource = self
        
        self.loginTableView.showsVerticalScrollIndicator = false
        self.loginTableView.separatorStyle = .none
        
        self.loginTableView.register(LogoCell.getNib(), forCellReuseIdentifier: LogoCell.identifier)
        self.loginTableView.register(FormCell.getNib(), forCellReuseIdentifier: FormCell.identifier)
        self.loginTableView.register(SeparatorCell.getNib(), forCellReuseIdentifier: SeparatorCell.identifier)
        self.loginTableView.register(SocialCell.getNib(), forCellReuseIdentifier: SocialCell.identifier)
        self.loginTableView.register(RegisterCell.getNib(), forCellReuseIdentifier: RegisterCell.identifier)
    }

}

extension LoginViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = self.loginTableView.dequeueReusableCell(withIdentifier: LogoCell.identifier, for: indexPath) as? LogoCell
            
            return cell ?? UITableViewCell()
        case 1:
            let cell = self.loginTableView.dequeueReusableCell(withIdentifier: FormCell.identifier, for: indexPath) as? FormCell
            
            return cell ?? UITableViewCell()
        case 2:
            let cell = self.loginTableView.dequeueReusableCell(withIdentifier: SeparatorCell.identifier, for: indexPath) as? SeparatorCell
            
            return cell ?? UITableViewCell()
        case 3:
            let cell = self.loginTableView.dequeueReusableCell(withIdentifier: SocialCell.identifier, for: indexPath) as? SocialCell
            
            return cell ?? UITableViewCell()
        default:
            let cell = self.loginTableView.dequeueReusableCell(withIdentifier: RegisterCell.identifier, for: indexPath) as? RegisterCell
            
            return cell ?? UITableViewCell()
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
            case 0: return 151
            case 1: return 260
            case 2: return 38
            case 3: return 156
            default: return 61
        }
    }
    
}
