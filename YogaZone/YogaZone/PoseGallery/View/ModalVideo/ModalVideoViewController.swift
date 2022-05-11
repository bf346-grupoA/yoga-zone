//
//  ModalVideoViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 12/03/22.
//

import UIKit

class ModalVideoViewController: UIViewController {
    var selectedPose: String? = nil
    
    @IBOutlet weak var thumbVideoImageView: UIImageView!
    
    @IBOutlet weak var videoTitleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}

extension ModalVideoViewController {
    func setupUI() {
        self.videoTitleLabel.text = selectedPose ?? "None"
    }
}
