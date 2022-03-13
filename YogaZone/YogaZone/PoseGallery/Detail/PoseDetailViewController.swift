//
//  PoseDetailViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 12/03/22.
//

import UIKit

class PoseDetailViewController: UIViewController {
    var selectedPose: Pose? = nil
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var categoriesTableView: UITableView!
    @IBOutlet weak var videoButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        setupUI()
        setupTableView()
    }

}


// MARK: IBActions
extension PoseDetailViewController {
    @IBAction func onClick(sender: UIButton) {
        let vc = ModalVideoViewController()
        vc.selectedPose = self.selectedPose?.name ?? "None"
    
        present(vc, animated: true, completion: nil)
    }
}

// MARK: UI
extension PoseDetailViewController {
    func setupUI() {
        
    }
    
    func setupTableView() {
        self.categoriesTableView.delegate = self
        self.categoriesTableView.dataSource = self
        
        self.categoriesTableView.layoutMargins = .init(top: 0.0, left: 23.5, bottom: 0.0, right: 23.5)
        // if you want the separator lines to follow the content width
        self.categoriesTableView.separatorInset = self.categoriesTableView.layoutMargins
        self.categoriesTableView.register(PoseCategoryCell.getNib(), forCellReuseIdentifier: PoseCategoryCell.identifier)
    }
}

// MARK: Data
extension PoseDetailViewController {
    func setupData() {

    }
}


// MARK: TableViewDelegate
extension PoseDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}


// MARK: TableViewDataSource
extension PoseDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedPose?.categories.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.categoriesTableView.dequeueReusableCell(withIdentifier: PoseCategoryCell.identifier, for: indexPath) as? PoseCategoryCell
        cell?.selectionStyle = .none
        
        let category = self.selectedPose?.categories[indexPath.row]
        cell?.setupCell(category ?? PoseCategory(id: 0, name: "None", description: "None"))
        
        return cell ?? UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
