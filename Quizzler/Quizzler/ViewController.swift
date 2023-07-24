//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var quesNumber = 0
    var score = 0
    var pickedAns : Bool = false
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = allQuestions.list[0].question
        progressLabel.text = "1/13"
        scoreLabel.text = "0"
        progressBar.frame.size.width = view.frame.size.width 
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if(sender.tag == 1) {
            pickedAns = true
        }
        else {
            pickedAns = false
        }
        checkAnswer()
    }
    
    
    func updateUI() {
        progressLabel.text = "\(quesNumber+1)/13"
        scoreLabel.text = String(score)
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(quesNumber + 1)
    }
    

    func nextQuestion() {
        
        if quesNumber <= 11 {
            score += 10
            quesNumber += 1
            questionLabel.text = allQuestions.list[quesNumber].question
            updateUI()
        }
        else {
            let alert = UIAlertController(title: "Awesome", message: "You've completed the quiz. Wanna start over?", preferredStyle: .actionSheet)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { UIAlertAction in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAns = allQuestions.list[quesNumber].answer
        if pickedAns == correctAns {
            nextQuestion()
        }
        else {
            let alert = UIAlertController(title: "Wrong Answer", message: "Your answer is incorrect. Please try again!", preferredStyle: .actionSheet)
            let restartAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func startOver() {
        quesNumber = 0
        score = 0
        questionLabel.text = allQuestions.list[quesNumber].question
        scoreLabel.text = String(score)
        progressLabel.text = "0/13"
    }
    

    
}
