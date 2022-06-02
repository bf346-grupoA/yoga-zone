//
//  LoginViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 24/03/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    var userData: UserData?
    var auth: Auth?
    
    @IBOutlet weak var loginTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        auth = Auth.auth()
        
        setupTableView()
        self.userData = UserData(email: "", password: "")
    }

    // MARK: Private methods
    private func setupTableView() {
        self.loginTableView.delegate = self
        self.loginTableView.dataSource = self
        self.loginTableView.showsVerticalScrollIndicator = false
        self.loginTableView.separatorStyle = .none
        
        registerCells()
    }
    
    private func registerCells() {
        self.loginTableView.register(LogoCell.getNib(), forCellReuseIdentifier: LogoCell.identifier)
        self.loginTableView.register(EmailAndPasswordCell.getNib(), forCellReuseIdentifier: EmailAndPasswordCell.identifier)
        self.loginTableView.register(ResetPasswordCell.getNib(), forCellReuseIdentifier: ResetPasswordCell.identifier)
        self.loginTableView.register(LoginButtonCell.getNib(), forCellReuseIdentifier: LoginButtonCell.identifier)
        self.loginTableView.register(SeparatorCell.getNib(), forCellReuseIdentifier: SeparatorCell.identifier)
        self.loginTableView.register(RegisterButtonCell.getNib(), forCellReuseIdentifier: RegisterButtonCell.identifier)
    }
}

// MARK: TableView Delegate & Datasource
extension LoginViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
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
            default: return 69
        }
    }
    
}


extension LoginViewController: FormDataDelegate, NavigationDelegate {
    func navigateTo(routeIndex: Int) {
        switch routeIndex {
            case 0: self.navigationController?.pushViewController(ResetPasswordViewController(), animated: true)
            case 1: self.navigationController?.pushViewController(HomeViewController(), animated: true)
            default: self.navigationController?.pushViewController(RegisterViewController(), animated: true)
        }
    }
    // TODO: ADD VALIDATION FIREBASE
    func send(userData: UserData) {
        self.userData = userData
    }
    
    
}
