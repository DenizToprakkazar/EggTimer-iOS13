//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    below written by DenizToprakkazar
    let eggTimes = ["Soft":300,"Medium":420,"Hard":720]
    var secondsRemaining = 60
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
    @objc func updateCounter() {
            if secondsPassed < totalTime {
            
            progressBar.progress=Float(secondsPassed)/Float(totalTime)
            secondsPassed += 1
            } else if secondsPassed == totalTime {
                progressBar.progress=1
                timer.invalidate()
                titleLabel.text="DONE!"
        }
    }
   
        
}

