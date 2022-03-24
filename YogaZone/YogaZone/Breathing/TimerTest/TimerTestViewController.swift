//
//  TimerTestViewController.swift
//  YogaZone
//
//  Created by Tadeu on 21/03/22.
//
import UIKit


class TimerTestViewController: UIViewController
{
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var addSeconds: UIButton!
    @IBOutlet weak var minusSeconds: UIButton!
    var timer = Timer()
    var seconds = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btnPlay = UIButton(type: .custom) as UIButton
        btnPlay.backgroundColor = UIColor(red: 114/255, green: 103/255, blue: 203/255, alpha: 1)
        btnPlay.setTitle("Play", for: .normal)
        btnPlay.titleLabel?.font = UIFont(name: "Montserrat-Semibold", size: 20)
        btnPlay.frame = CGRect(x: 160, y: 450, width: 100, height: 100)
        btnPlay.addTarget(self, action: #selector(clickMePlay), for: .touchUpInside)
        btnPlay.layer.cornerRadius = 50
        self.view.addSubview(btnPlay)
        
        
        let btnPause = UIButton(type: .custom) as UIButton
        btnPause.backgroundColor = UIColor(red: 114/255, green: 103/255, blue: 203/255, alpha: 1)
        btnPause.setTitle("Pause", for: .normal)
        btnPause.titleLabel?.font = UIFont(name: "Montserrat-Semibold", size: 20)
        btnPause.frame = CGRect(x:160 , y: 350, width: 100, height: 50)
        btnPause.addTarget(self, action: #selector(clickMePause), for: .touchUpInside)
        btnPause.layer.cornerRadius = 8
        self.view.addSubview(btnPause)

        lazy var btnReset:UIButton = {
            let btnReset = UIButton(type: .custom)
            btnReset.translatesAutoresizingMaskIntoConstraints = false
            btnReset.backgroundColor = UIColor(red: 114/255, green: 103/255, blue: 203/255, alpha: 1)
            btnReset.setTitle("Reset", for: .normal)
            btnReset.titleLabel?.font = UIFont(name: "Montserrat-Semibold", size: 20)
            btnReset.frame = CGRect(x:160 , y: 600, width: 100, height: 50)
            btnReset.addTarget(self, action: #selector(clickMeReset), for: .touchUpInside)
            btnReset.layer.cornerRadius = 8
            return btnReset
        }()
        
        self.view.addSubview(btnReset)
        
//        btnPause.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 157).isActive = true
     
        btnReset.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        btnReset.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                
    }
    
    @IBAction func startButton(_ sender: Any)
    {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerTestViewController.timerClass), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseButton(_ sender: Any)
    {
        timer.invalidate()
    }

    @IBAction func resetButton(_ sender: Any)
    {
        timer.invalidate()
        seconds = 60
        timerLabel.text = String(seconds)
    }
    
    @IBAction func addSecnds(_ sender: Any)
    {
        seconds = seconds + 5
            timerLabel.text = String(seconds)
    }
    
    @IBAction func minusSeconds(_ sender: Any)
    {
    seconds = seconds - 5
        timerLabel.text = String(seconds)
        
    }
    
    @objc func clickMePlay(sender:UIButton!) {
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerTestViewController.timerClass), userInfo: nil, repeats: true)
        
      print("Button Clicked")
    }
    
    @objc func clickMePause(sender:UIButton!) {
        
        timer.invalidate()
      print("Button Paused")
    }
    
    
    @objc func clickMeReset(sender:UIButton!) {
        
        timer.invalidate()
        seconds = 60
        timerLabel.text = String(seconds)
    }
    
    @objc func timerClass()
    {
    seconds -= 1
        timerLabel.text = String(seconds)
        
        if(seconds == 0)
        {
            timer.invalidate()
        }
    }

}
