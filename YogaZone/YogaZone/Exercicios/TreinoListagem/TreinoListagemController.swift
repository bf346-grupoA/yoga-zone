//
//  TreinoListagemController.swift
//  YogaZone
//
//  Created by Marcus on 21/02/22.
//

import UIKit

class TreinoListagemController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tappedArrowVoltar: UIImageView!
    
    @IBOutlet weak var TitleTreino: UILabel!
    
    //Calories
    @IBOutlet weak var CircleCaloriesImage: UIImageView!
    
    @IBOutlet weak var NumberOfCaloriesLabel: UILabel!
    
    @IBOutlet weak var CaloriesTitleLabel: UILabel!
    
    // Minutes
    @IBOutlet weak var CircleMinutesImage: UIImageView!
    
    @IBOutlet weak var NumberOfMinutesLabel: UILabel!
    
    @IBOutlet weak var MinutesTitleLabel: UILabel!
    
    //Positions
    @IBOutlet weak var CirclePositionsImage: UIImageView!
    
    @IBOutlet weak var PositionsTitleLabel: UILabel!
    
    @IBOutlet weak var NumberOfPositionsLabel: UILabel!
    
    //Table View
    
    @IBOutlet weak var ListTrainYogaTableView: UITableView!
    
    //Start Train Button
    @IBOutlet weak var startTrainButton: UIButton!
    
    
    private var arrayExercices:[String] = ["Natarajasana", "Sarvagansana", "Prancha Lateral", "Curvatura Frente"]
    private var arrayExercicesDuration:[String] = ["60s", "55s", "60s", "40s"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configBackButton()
        CircleCaloriesImage.image = UIImage(named: "CircleCaloriesImage")
        CircleMinutesImage.image = UIImage(named: "CircleMinutesImage")
        CirclePositionsImage.image = UIImage(named: "CirclePositionsImage")
        tappedArrowVoltar.image = UIImage(named: "arrowVoltarCinza")
        
        //Table View
        self.ListTrainYogaTableView.register(UINib(nibName: "TreinoCustomCell", bundle: nil), forCellReuseIdentifier: "TreinoCustomCell")
        self.ListTrainYogaTableView.delegate = self
        self.ListTrainYogaTableView.dataSource = self
        
        // Hide Back Button from UINavigationItem
        self.navigationItem.setHidesBackButton(true, animated: true)

    }
    
    private func configBackButton(){
        let tapBackButton = UITapGestureRecognizer(target: self, action: #selector(self.tappedBackButton))
        self.tappedArrowVoltar.addGestureRecognizer(tapBackButton)
        self.tappedArrowVoltar.isUserInteractionEnabled = true
        
    }
    
    @objc func tappedBackButton(){
        self.navigationController?.popViewController(animated: true)
    }

    
    @IBAction func tappedStartTrainButton(_ sender: UIButton) {
    }
}

extension TreinoListagemController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayExercices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TreinoCustomCell? = tableView.dequeueReusableCell(withIdentifier: "TreinoCustomCell", for: indexPath) as? TreinoCustomCell
        
        cell?.treinoImageView.image = UIImage(named: self.arrayExercices[indexPath.row])
        cell?.treinoDescriptionLabel.text = self.arrayExercices[indexPath.row]
        cell?.treinoDurationLabel.text = self.arrayExercicesDuration[indexPath.row]
        
        return cell ?? UITableViewCell()
    }
}
