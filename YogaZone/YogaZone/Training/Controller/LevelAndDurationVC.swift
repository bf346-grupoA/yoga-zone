//
//  TreinoUmController.swift
//  YogaZone
//
//  Created by Marcus on 20/02/22.
//

import UIKit


class LevelAndDurationVC: UIViewController, UIGestureRecognizerDelegate {
    

    @IBOutlet weak var durationNameLabel: UILabel!
    @IBOutlet weak var levelNameLabel: UILabel!
    @IBOutlet weak var circleBackground: UIImageView!
    @IBOutlet weak var titleTreinoDeYoga: UILabel!
    @IBOutlet weak var descriptionTreinoDeYoga: UILabel!
    @IBOutlet weak var timeDurationImage: UIImageView!
    @IBOutlet weak var levelExerciceImage: UIImageView!
    @IBOutlet weak var seeTrainButton: UIButton!
    
    //MARK: - Variables
    
    var durationDropDown = MakeDropDown()
    var levelDropDown = MakeDropDown()
    var dropDownRowHeight:CGFloat = 30
    
    var durationDropDownIdentifier: String = "DURATION_DROP_DOWN"
    var levelDropDownIdentifier: String = "LEVEL_DROP_DOWN"
    
    var durationArr: [DurationModel] = [DurationModel]()
    var levelArr: [LevelModel] = [LevelModel]()
    
    //MARK: - Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configImages()
        self.setUpGestures()
        self.populateDropDownArrays()
        self.setupNavigationBar()
        self.setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpDurationDropDown()
        setUpLevelDropDown()
    }
    
    func configImages(){
        circleBackground.image = UIImage(named: "circleBackground")
        timeDurationImage.image = UIImage(named: "timeDuration")
        levelExerciceImage.image = UIImage(named: "levelExercice")
    }
    
    //MARK: - Setup Methods
    func setUpDurationDropDown(){
        durationDropDown.makeDropDownIdentifier = self.durationDropDownIdentifier
        durationDropDown.cellReusableIdentifier = "durationDropDownCell"
        durationDropDown.makeDropDownDataSourceProtocol = self
        durationDropDown.setUpDropDown(viewPositionReference: (durationNameLabel.frame), offset: 5)
        durationDropDown.nib = UINib(nibName: "DropDownTableViewCell", bundle: nil)
        durationDropDown.setRowHeight(height: self.dropDownRowHeight)
        self.view.addSubview(durationDropDown)
    }
    
    func setUpLevelDropDown(){
        levelDropDown.makeDropDownIdentifier = self.levelDropDownIdentifier
        levelDropDown.cellReusableIdentifier = "levelDropDownCell"
        levelDropDown.makeDropDownDataSourceProtocol = self
        levelDropDown.setUpDropDown(viewPositionReference: (levelNameLabel.frame), offset: 5)
        levelDropDown.nib = UINib(nibName: "DropDownTwoTableViewCell", bundle: nil)
        levelDropDown.setRowHeight(height: self.dropDownRowHeight)
        self.view.addSubview(levelDropDown)
    }
    
    //MARK: - Gesture Setup
    func setUpGestures(){
        self.durationNameLabel.isUserInteractionEnabled = true
        let durationNameLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(durationNameLabelTapped))
        self.durationNameLabel.addGestureRecognizer(durationNameLabelTapGesture)
        
        self.levelNameLabel.isUserInteractionEnabled = true
        let levelNameLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(levelNameLabelTapped))
        self.levelNameLabel.addGestureRecognizer(levelNameLabelTapGesture)
    }
    
    //MARK: - Populate Data
    func populateDropDownArrays(){
            let durationModel1 = DurationModel(durationName: "10 minutos")
            let levelModel1 = LevelModel(levelName: "Iniciante")

            self.durationArr.append(durationModel1)
            self.levelArr.append(levelModel1)
    }
    
    //MARK: - Selector Methods
    @objc func durationNameLabelTapped(){
        self.durationDropDown.showDropDown(height: self.dropDownRowHeight * 1)
    }
    @objc func levelNameLabelTapped(){
        self.levelDropDown.showDropDown(height: self.dropDownRowHeight * 1)
    }
    
    //MARK: - SetupUI
    func configLabels(){
        self.titleTreinoDeYoga.font = UIFont(name: "Comfortaa-Bold", size: 24)
        self.titleTreinoDeYoga.textAlignment = .center
        self.descriptionTreinoDeYoga.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.descriptionTreinoDeYoga.textAlignment = .center
        self.durationNameLabel.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.levelNameLabel.font = UIFont(name: "Comfortaa-Bold", size: 16)
    }
    
    func configSeeTrainButton(){
        self.seeTrainButton.configuration = nil
        self.seeTrainButton.setTitle("Ver Treino", for: .normal)
        self.seeTrainButton.setTitleColor(.darkGray, for: .normal)
        self.seeTrainButton.titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 16)
        self.seeTrainButton.backgroundColor = #colorLiteral(red: 0.4470588235, green: 0.4039215686, blue: 0.7960784314, alpha: 1)
        self.seeTrainButton.layer.cornerRadius = 26
        self.seeTrainButton.isEnabled = false
    }

    func setupUI(){
        self.configLabels()
        self.configSeeTrainButton()
    }
    
    @IBAction func tappedSeeTrainButton(_ sender: UIButton) {
        let vc = TrainingListController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LevelAndDurationVC: MakeDropDownDataSourceProtocol{
    func numberOfRows(makeDropDownIdentifier: String) -> Int {
        if makeDropDownIdentifier == self.durationDropDownIdentifier{
            return self.durationArr.count
        }else{
            return self.levelArr.count
        }
    }
    
    func getDataToDropDown(cell: UITableViewCell, indexPos: Int, makeDropDownIdentifier: String) {
        if makeDropDownIdentifier == self.durationDropDownIdentifier{
            let durationDropDownCell = cell as! DropDownTableViewCell
            durationDropDownCell.durationNameLabel.text = self.durationArr[indexPos].durationName
        }
        else{
            let levelDropDownCell = cell as! DropDownTwoTableViewCell
            levelDropDownCell.levelNameLabel.text = self.levelArr[indexPos].levelName
        }
    }
    
    func levelOfRows(makeDropDownIdentifier: String) -> Int {
        if makeDropDownIdentifier == self.durationDropDownIdentifier{
            return self.durationArr.count
        }else{
            return self.levelArr.count
        }
    }
    
    func selectItemInDropDown(indexPos: Int, makeDropDownIdentifier: String) {
        if makeDropDownIdentifier == self.durationDropDownIdentifier{
            self.durationNameLabel.text = self.durationArr[indexPos].durationName
            self.durationDropDown.hideDropDown()
        }else{
            self.levelNameLabel.text = self.levelArr[indexPos].levelName
            self.levelDropDown.hideDropDown()
        }
        seeTrainButtonValidation()
        
    }
    
    func seeTrainButtonValidation(){
        if durationNameLabel.text != "Duração" &&
            levelNameLabel.text != "Nivel" {
            self.seeTrainButton.isEnabled = true
            self.seeTrainButton.setTitleColor(.white, for: .normal)
        } else {
            self.seeTrainButton.isEnabled = false
        }
    }
}

// MARK: Navigation Bar Customization
extension LevelAndDurationVC {
    func setupNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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

