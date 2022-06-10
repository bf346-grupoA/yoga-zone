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
        setupNavigationBar()
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
        self.posesTableView.showsVerticalScrollIndicator = false
    }
}


// MARK: Data
extension PoseGalleryViewController {
    func setupData() {
        for n in 1...13 {
            var pose = Pose(id: n, name: poseNames[n] ?? "1", categories: [])
            
            pose.categories = [
                PoseCategory(id: 12, name: "Good", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "Hard", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "Impossible", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "Math", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "Geometrics", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "Painful", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "Annoying", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "Nice", description: "GitHub is united with the people of Ukraine and the international community.")
            ]
            
            poses.append(pose)
        }
    }
}


// MARK: TableViewDelegate
extension PoseGalleryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.posesTableView.dequeueReusableCell(withIdentifier: PoseCell.identifier, for: indexPath) as? PoseCell
        let pose = poses[indexPath.section]
        
        cell?.setupCell(pose)
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPose = poses[indexPath.section]
        let vc = PoseDetailViewController()
        vc.videoId = getVideoPoseId(indexPath: indexPath)
        vc.selectedPose = selectedPose
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78
    }
    
    func getVideoPoseId(indexPath:IndexPath) -> String {
        switch indexPath.row {
        case 0:
            return "8KsyQvwi85Q"
        case 1:
            return "0495rbXZMQg"
        case 2:
            return "FCuSE4oS9xc"
        case 3:
            return "egqMxaJ9mKw"
        case 4:
            return "YXOeBUjmERI"
        case 5:
            return "8q7GxnIFsQo"
        case 6:
            return "98NweOVmU8"
        case 7:
            return "NuYfAhZ2MhM"
        case 8:
            return "0FxWRAJht6k"
        case 9:
            return "J_lLt6-GlMo"
        case 10:
            return "1VYlOKUdylM"
        case 11:
            return "lu358XJfYnk"
        default:
            return "3_jMiU6_3NE"
        }
    }
    
    
}

// MARK: TableViewDataSource
extension PoseGalleryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return poses.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }
}

// MARK: Navigation Bar Customization
extension PoseGalleryViewController: UIGestureRecognizerDelegate {
    
    func setupNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
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
