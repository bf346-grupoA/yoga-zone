//
//  TreinoUmController.swift
//  YogaZone
//
//  Created by Marcus on 20/02/22.
//

import UIKit


class TreinoUmController: UIViewController {
    

    @IBOutlet weak var durationNameLabel: UILabel!
    
    @IBOutlet weak var levelNameLabel: UILabel!
    
    @IBOutlet weak var circleBackground: UIImageView!
    
    @IBOutlet weak var titleTreinoDeYoga: UILabel!
    
    @IBOutlet weak var descriptionTreinoDeYoga: UILabel!
    
    @IBOutlet weak var tappedArrowVoltar: UIImageView!
    
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
        self.configBackButton()
        setUpGestures()
        populateDropDownArrays()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpDurationDropDown()
        setUpLevelDropDown()
    }
    
    func configImages(){
        tappedArrowVoltar.image = UIImage(named: "arrowVoltar")
        circleBackground.image = UIImage(named: "circleBackground")
        timeDurationImage.image = UIImage(named: "timeDuration")
        levelExerciceImage.image = UIImage(named: "levelExercice")
        
        // Hide Back Button from UINavigationItem
        self.navigationItem.setHidesBackButton(true, animated: true)
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
            let durationModel2 = DurationModel(durationName: "15 minutos")
            let durationModel3 = DurationModel(durationName: "20 minutos")
            let durationModel4 = DurationModel(durationName: "25 minutos")

            let levelModel1 = LevelModel(levelName: "Iniciante")
            let levelModel2 = LevelModel(levelName: "Pouco Experiente")
            let levelModel3 = LevelModel(levelName: "Intermediário")
            let levelModel4 = LevelModel(levelName: "Guru")
              
            self.durationArr.append(durationModel1)
            self.durationArr.append(durationModel2)
            self.durationArr.append(durationModel3)
            self.durationArr.append(durationModel4)
        
            self.levelArr.append(levelModel1)
            self.levelArr.append(levelModel2)
            self.levelArr.append(levelModel3)
            self.levelArr.append(levelModel4)
    }
    
    //MARK: - Selector Methods
    @objc func durationNameLabelTapped(){
        self.durationDropDown.showDropDown(height: self.dropDownRowHeight * 4)
    }
    @objc func levelNameLabelTapped(){
        self.levelDropDown.showDropDown(height: self.dropDownRowHeight * 4)
    }
    
    private func configBackButton(){
        let tapBackButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedBackButton))
        self.tappedArrowVoltar.addGestureRecognizer(tapBackButton)
        self.tappedArrowVoltar.isUserInteractionEnabled = true
        
    }
    
    @objc func tappedBackButton(){
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func tappedSeeTrainButton(_ sender: UIButton) {
        let vc = TreinoListagemController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TreinoUmController: MakeDropDownDataSourceProtocol{
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
            self.levelNameLabel.text = levelArr[indexPos].levelName
            self.levelDropDown.hideDropDown()
        }
    }
}

