//
//  RingBreathingViewController.swift
//  YogaZone
//
//  Created by Tadeu on 23/03/22.
//

import UIKit

class InhaleViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()
    var seconds = 15
    
    let shape = CAShapeLayer()

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = ("Segundos")
        label.font = .systemFont(ofSize: 36, weight: .light)
        
        
        return label
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.sizeToFit()
        view.addSubview(label)
        label.frame = CGRect(x: 200 , y: 300, width: 374, height: 65)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 330).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true

        
        let ciclePath = UIBezierPath(arcCenter: view.center,
                                     radius: 120,
                                     startAngle: -(.pi / 2),
                                     endAngle: .pi * 2,
                                     clockwise: true)
        
        let trackShape = CAShapeLayer()
        trackShape.path = ciclePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 15
        trackShape.frame = CGRect(x: -20, y: -130, width: 100, height: 50)
        trackShape.strokeColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(trackShape)
        
        shape.path = ciclePath.cgPath
        shape.lineWidth = 15
        shape.strokeColor = CGColor(red: 114/255, green: 103/255, blue: 203/255, alpha: 1)
        shape.frame = CGRect(x: -4, y: -130, width: 100, height: 50)
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 20, y: 550, width: 350, height: 50)
        button.setTitle("Iniciar", for: .normal)
        button.backgroundColor = UIColor(red: 114/255, green: 103/255, blue: 203/255, alpha: 1)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 8
        
        view.addSubview(button)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        
        
//        let btnPlay = UIButton(type: .custom) as UIButton
//        btnPlay.backgroundColor = UIColor(red: 114/255, green: 103/255, blue: 203/255, alpha: 1)
//        btnPlay.setTitle("Play", for: .normal)
//        btnPlay.titleLabel?.font = UIFont(name: "Montserrat-Semibold", size: 20)
//        btnPlay.frame = CGRect(x: 160, y: 450, width: 100, height: 100)
//        btnPlay.addTarget(self, action: #selector(clickMePlay), for: .touchUpInside)
//        btnPlay.layer.cornerRadius = 50
//        self.view.addSubview(btnPlay)
        
    }

    @objc func didTapButton(){
        // Animate
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 19
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerTestViewController.timerClass), userInfo: nil, repeats: true)
        
      print("Button Clicked")


    }
    
//    @objc func clickMePlay(sender:UIButton!) {
//
//        timer.invalidate()
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerTestViewController.timerClass), userInfo: nil, repeats: true)
//
//      print("Button Clicked")
//    }
    
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
