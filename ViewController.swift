//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = ["Soft": 5, "Medium":7, "Hard":12]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        progressBar.progress = 0.0
        doneLabel.text = ""
        secondsPassed = 0
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]! * 60
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updatedTime), userInfo: nil, repeats: true)
        
    }
    
    @objc func updatedTime(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            doneLabel.text = "\(secondsPassed)s / \(totalTime)s"
            progressBar.progress = Float(secondsPassed)/Float(totalTime)
            
        }else{
            timer.invalidate()
            doneLabel.text = "Done! :)"
        }
    }
    
    
    
}
