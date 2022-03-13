//
//  PoseGalleryViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 12/03/22.
//

import UIKit

class PoseGalleryViewController: UIViewController {
    var poses: [Pose] = []
    @IBOutlet weak var poseLabel: UILabel!
    @IBOutlet weak var posesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupTableView()
        setupUI()
    }
}

// MARK: UI
extension PoseGalleryViewController {
    func setupUI() {
        
    }
    
    func setupTableView() {
        self.posesTableView.delegate = self
        self.posesTableView.dataSource = self
        self.posesTableView.register(PoseCell.getNib(), forCellReuseIdentifier: PoseCell.identifier)
        self.posesTableView.separatorStyle = .none
    }
}


// MARK: Data
extension PoseGalleryViewController {
    func setupData() {
        for n in 1...30 {
            var pose = Pose(id: n, name: "Pose - \(n)", categories: [])
            
            pose.categories = [
                PoseCategory(id: 12, name: "2345234", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "2345234", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "2345234", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "2345234", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "2345234", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "2345234", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "2345234", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "2345234", description: "GitHub is united with the people of Ukraine and the international community.")
            ]
            
            poses.append(pose)
        }
    }
}


// MARK: TableViewDelegate
extension PoseGalleryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.posesTableView.dequeueReusableCell(withIdentifier: PoseCell.identifier, for: indexPath) as? PoseCell
        let pose = poses[indexPath.row]
        
        cell?.setupCell(pose)
        
        cell?.layer.cornerRadius = 8
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPose = poses[indexPath.row]
        let vc = PoseDetailViewController()
        vc.selectedPose = selectedPose
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: TableViewDataSource
extension PoseGalleryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

