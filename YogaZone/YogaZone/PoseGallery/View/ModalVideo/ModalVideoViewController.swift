//
//  ModalVideoViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 12/03/22.
//

import UIKit
import youtube_ios_player_helper

class ModalVideoViewController: UIViewController {
    var videoId: String = ""
    

    @IBOutlet weak var youTubePlayerView: YTPlayerView!
    
    @IBOutlet weak var videoTitleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getPoseVideo(id: videoId)
    }
    
    func getPoseVideo(id:String){
        youTubePlayerView.load(withVideoId: id)
    }

}

