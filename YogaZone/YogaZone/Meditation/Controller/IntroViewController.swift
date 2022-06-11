//
//  IntroViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 05/03/22.
//

import UIKit

//TODO: Change class name to MeditationIntroViewController
class IntroViewController: UIViewController{
    
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
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

// MARK: Navigation Bar Customization
extension IntroViewController: UIGestureRecognizerDelegate  {
    
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

