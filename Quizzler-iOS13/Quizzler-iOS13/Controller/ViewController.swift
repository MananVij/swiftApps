//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var questionText: UILabel!
    @IBOutlet private weak var trueButton: UIButton!
    @IBOutlet private weak var falseButton: UIButton!
    @IBOutlet private weak var progressBar: UIProgressView!
    @IBOutlet private weak var scoreLabel: UILabel!
    
    private var quizBrain = QuizBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = quizBrain.quiz[0].q
        // Do any additional setup after loading the view.
    }
    
    /// <#Description#>
    /// - Parameter sender: <#sender description#>
    @IBAction private func answerButtonPressed(_ sender: UIButton) {
        
        let result = quizBrain.checkAns( (sender.titleLabel?.text)!)
        if result {
            quizBrain.nextQues()
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    @objc private func updateUI() {
        questionText.text = quizBrain.getQuesText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    
    
}

