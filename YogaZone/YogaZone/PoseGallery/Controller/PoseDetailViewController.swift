//
//  PoseDetailViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 12/03/22.
//

import UIKit
import youtube_ios_player_helper

class PoseDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var categoriesTableView: UITableView!
    @IBOutlet weak var videoButton: YTPlayerView!
    
    var selectedPose: Pose? = nil
    var linkYoutube: String?
    var videoId: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        setupNavigationBar()
        
    }
}


// MARK: IBActions
extension PoseDetailViewController {
    @IBAction func onClick(sender: UIButton) {
        let vc = ModalVideoViewController()
        let nav = UINavigationController(rootViewController: vc)
        if let sheet = nav.sheetPresentationController{
            sheet.detents = [.medium()]
        }
        vc.videoId = self.videoId
    
        present(nav, animated: true, completion: nil)
    }
}

// MARK: UI
extension PoseDetailViewController {
    func setupUI() {
        self.titleLabel.text = selectedPose?.name ?? ""
    }
    
    func setupTableView() {
        self.categoriesTableView.delegate = self
        self.categoriesTableView.dataSource = self
        self.categoriesTableView.separatorStyle = .none
        self.categoriesTableView.showsVerticalScrollIndicator = false
        self.categoriesTableView.register(PoseCategoryCell.getNib(), forCellReuseIdentifier: PoseCategoryCell.identifier)
    }
}

// MARK: TableViewDelegate & TableViewDataSource
extension PoseDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.categoriesTableView.dequeueReusableCell(withIdentifier: PoseCategoryCell.identifier, for: indexPath) as? PoseCategoryCell
        
        guard let category = self.selectedPose?.categories[indexPath.section] else { return UITableViewCell() }
        
        cell?.selectionStyle = .none
        cell?.setupCell(category: category)
        
        return cell ?? UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.selectedPose?.categories.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }
}

// MARK: Navigation Bar Customization
extension PoseDetailViewController: UIGestureRecognizerDelegate {
    
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
