//
//  IntroViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 05/03/22.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func onStart(_ sender: UIButton) {
        self.navigationController?.pushViewController(MeditationHomeViewController(), animated: true)
    }
    
}

extension IntroViewController {
    func setupUI() {
        self.introImageView.image = #imageLiteral(resourceName: "meditacao-intro")
    }
}
