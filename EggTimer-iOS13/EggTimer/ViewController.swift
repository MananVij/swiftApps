//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    var secondsRemaining = 60
    let hardnessDict : [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var hardnessSelected: Int? = nil

    @IBAction func hardnessSelector(_ sender: UIButton) {
        
        progressBar.progress = 1.0
        timer.invalidate()
        let hardness = sender.currentTitle!
        secondsRemaining = hardnessDict[hardness]!
        hardnessSelected = secondsRemaining
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
        }
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            secondsRemaining -= 1
            progressBar.progress = Float(secondsRemaining)/Float(hardnessSelected!)        }
        else {
            timer.invalidate()
        }
    }
    
}
