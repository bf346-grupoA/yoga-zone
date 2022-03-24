//
//  LoginViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import UIKit

class LoginViewController: UIViewController {
    var userData: UserData?
    @IBOutlet weak var loginTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        self.userData = UserData(email: "", password: "")
    }

    
    private func setupTableView() {
        self.loginTableView.delegate = self
        self.loginTableView.dataSource = self
        
        self.loginTableView.showsVerticalScrollIndicator = false
        self.loginTableView.separatorStyle = .none
        
        self.loginTableView.register(LogoCell.getNib(), forCellReuseIdentifier: LogoCell.identifier)
        self.loginTableView.register(EmailAndPasswordCell.getNib(), forCellReuseIdentifier: EmailAndPasswordCell.identifier)
        self.loginTableView.register(ResetPasswordCell.getNib(), forCellReuseIdentifier: ResetPasswordCell.identifier)
        self.loginTableView.register(LoginButtonCell.getNib(), forCellReuseIdentifier: LoginButtonCell.identifier)
        self.loginTableView.register(SeparatorCell.getNib(), forCellReuseIdentifier: SeparatorCell.identifier)
        self.loginTableView.register(GoogleButtonCell.getNib(), forCellReuseIdentifier: GoogleButtonCell.identifier)
        self.loginTableView.register(FacebookButtonCell.getNib(), forCellReuseIdentifier: FacebookButtonCell.identifier)
        self.loginTableView.register(RegisterButtonCell.getNib(), forCellReuseIdentifier: RegisterButtonCell.identifier)
    }
}

extension LoginViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                let cell = self.loginTableView.dequeueReusableCell(withIdentifier: LogoCell.identifier, for: indexPath) as? LogoCell
                
                cell?.selectionStyle = .none
                return cell ?? UITableViewCell()
            
            case 1:
                let cell = self.loginTableView.dequeueReusableCell(withIdentifier: EmailAndPasswordCell.identifier, for: indexPath) as? EmailAndPasswordCell
                
                cell?.delegate = self
                cell?.selectionStyle = .none
            
                return cell ?? UITableViewCell()
            
            case 2:
                let cell = self.loginTableView.dequeueReusableCell(withIdentifier: ResetPasswordCell.identifier, for: indexPath) as? ResetPasswordCell
                
                cell?.delegate = self
                cell?.selectionStyle = .none
                return cell ?? UITableViewCell()
            
            case 3:
                let cell = self.loginTableView.dequeueReusableCell(withIdentifier: LoginButtonCell.identifier, for: indexPath) as? LoginButtonCell
                cell?.delegate = self
                cell?.selectionStyle = .none
                
            return cell ?? UITableViewCell()
            
            case 4:
                let cell = self.loginTableView.dequeueReusableCell(withIdentifier: SeparatorCell.identifier, for: indexPath) as? SeparatorCell
                
                cell?.selectionStyle = .none
                
                return cell ?? UITableViewCell()
            
            case 5:
                let cell = self.loginTableView.dequeueReusableCell(withIdentifier: GoogleButtonCell.identifier, for: indexPath) as? GoogleButtonCell
                
                cell?.delegate = self
                cell?.selectionStyle = .none
                
                return cell ?? UITableViewCell()
            
            case 6:
                let cell = self.loginTableView.dequeueReusableCell(withIdentifier: FacebookButtonCell.identifier, for: indexPath) as? FacebookButtonCell
                
                cell?.delegate = self
                cell?.selectionStyle = .none
            
                return cell ?? UITableViewCell()
            
            default:
                let cell = self.loginTableView.dequeueReusableCell(withIdentifier: RegisterButtonCell.identifier, for: indexPath) as? RegisterButtonCell
                
                cell?.delegate = self
                cell?.selectionStyle = .none
            
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
            case 0: return 123
            case 1: return 145
            case 2: return 44
            case 3: return 90
            case 4: return 40
            case 5: return 69
            case 6: return 69
            default: return 50
        }
    }
    
}


extension LoginViewController: FormValidation, Navigable {
    func navigateTo(routeIndex: Int) {
        switch routeIndex {
            case 0: self.navigationController?.pushViewController(ResetPasswordViewController(), animated: true)
            case 1: self.navigationController?.pushViewController(HomeViewController(), animated: true)
            case 2: self.navigationController?.pushViewController(HomeViewController(), animated: true)
            case 3: self.navigationController?.pushViewController(HomeViewController(), animated: true)
            default: self.navigationController?.pushViewController(HomeViewController(), animated: true)
        }
    }
    
    func send(userData: UserData) {
        self.userData = userData
    }
    
    
}
