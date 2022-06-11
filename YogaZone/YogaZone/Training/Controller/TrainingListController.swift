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
    

    var exercicesData: [ExercicesModel] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.setupUI()
            self.setupNavigationBar()
            self.setupData()
            self.ListTrainYogaTableView.register(TrainingCustomCell.nib(), forCellReuseIdentifier: TrainingCustomCell.identifier)
            self.ListTrainYogaTableView.delegate = self
            self.ListTrainYogaTableView.dataSource = self
        }

//MARK: - SetupUI
    func configLabels(){
        self.NumberOfCaloriesLabel.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.NumberOfCaloriesLabel.textAlignment = .center
        self.CaloriesTitleLabel.font = UIFont(name: "Comfortaa-Bold", size: 14)
        
        self.NumberOfMinutesLabel.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.NumberOfMinutesLabel.textAlignment = .center
        self.MinutesTitleLabel.font = UIFont(name: "Comfortaa-Bold", size: 14)
        
        self.NumberOfPositionsLabel.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.NumberOfPositionsLabel.textAlignment = .center
        self.PositionsTitleLabel.font = UIFont(name: "Comfortaa-Bold", size: 14)
        
    }
    
    func setupImages(){
        CircleCaloriesImage.image = UIImage(named: "CircleCaloriesImage")
        CircleMinutesImage.image = UIImage(named: "CircleMinutesImage")
        CirclePositionsImage.image = UIImage(named: "CirclePositionsImage")
    }
    
    func setupStartTrainButton(){
        var containerTitle = AttributeContainer()
        containerTitle.font = UIFont(name: "Comfortaa-Bold", size: 16)
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        config.baseForegroundColor = .white
        config.attributedTitle = AttributedString("Iniciar Treino", attributes: containerTitle)
        
        self.startTrainButton.configuration = config
        self.startTrainButton.layer.cornerRadius = 8
    }
    
    func setupUI(){
        self.configLabels()
        self.setupStartTrainButton()
        self.setupImages()
    }
    
    
    @IBAction func tappedStartTrainButton(_ sender: UIButton) {
        let vc = TrainingStartedVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - TableView
extension TrainingListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exercicesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TrainingCustomCell? = tableView.dequeueReusableCell(withIdentifier: TrainingCustomCell.identifier, for: indexPath) as? TrainingCustomCell
        cell?.setupCell(data: self.exercicesData[indexPath.row])
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
            image: UIImage(named: CommonConstants.backArrowImage.rawValue),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
    }
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: Populate Data
extension TrainingListController {
    func setupData() {
        let jsonData = trainingListMock.data(using: .utf8)
        do {
            let exercices = try JSONDecoder().decode([ExercicesModel].self, from: jsonData ?? Data() )
            exercices.forEach { self.exercicesData.append($0)}
        } catch {
            print(error)
        }
    }
}

