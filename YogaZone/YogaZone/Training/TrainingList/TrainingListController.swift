//
//  TreinoListagemController.swift
//  YogaZone
//
//  Created by Marcus on 21/02/22.
//

import UIKit

class TrainingListController: UIViewController, UITableViewDataSource, UIGestureRecognizerDelegate {

    @IBOutlet weak var CircleCaloriesImage: UIImageView!
    @IBOutlet weak var NumberOfCaloriesLabel: UILabel!
    @IBOutlet weak var CaloriesTitleLabel: UILabel!
    @IBOutlet weak var CircleMinutesImage: UIImageView!
    @IBOutlet weak var NumberOfMinutesLabel: UILabel!
    @IBOutlet weak var MinutesTitleLabel: UILabel!
    @IBOutlet weak var CirclePositionsImage: UIImageView!
    @IBOutlet weak var PositionsTitleLabel: UILabel!
    @IBOutlet weak var NumberOfPositionsLabel: UILabel!
    @IBOutlet weak var ListTrainYogaTableView: UITableView!
    @IBOutlet weak var startTrainButton: UIButton!
    
    
    private var arrayExercices:[String] = ["Natarajasana", "Sarvagansana", "Prancha Lateral", "Curvatura Frente", "Bakasana", "Boat", "Dolphin", "Garudasana", "Pigeon"]
    private var arrayExercicesDuration:[String] = ["60s", "55s", "60s", "40s", "55s", "60s", "40s", "45s", "55s"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupImages()
        self.ListTrainYogaTableView.register(TrainingCustomCell.nib(), forCellReuseIdentifier: TrainingCustomCell.identifier)
        self.ListTrainYogaTableView.delegate = self
        self.ListTrainYogaTableView.dataSource = self
    }

    func setupImages(){
        CircleCaloriesImage.image = UIImage(named: "CircleCaloriesImage")
        CircleMinutesImage.image = UIImage(named: "CircleMinutesImage")
        CirclePositionsImage.image = UIImage(named: "CirclePositionsImage")
    }
    
    @IBAction func tappedStartTrainButton(_ sender: UIButton) {
        let vc = TrainingStartedVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TrainingListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayExercices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TrainingCustomCell? = tableView.dequeueReusableCell(withIdentifier: TrainingCustomCell.identifier, for: indexPath) as? TrainingCustomCell
        cell?.treinoImageView.image = UIImage(named: self.arrayExercices[indexPath.row])
        cell?.treinoDescriptionLabel.text = self.arrayExercices[indexPath.row]
        cell?.treinoDurationLabel.text = self.arrayExercicesDuration[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: Navigation Bar Customization
extension TrainingListController {
    func setupNavigationBar(){
        self.navigationItem.title = "Seu Treino"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 16) ?? UIFont()]
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
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

