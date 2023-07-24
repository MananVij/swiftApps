//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Manan Vij on 19/07/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

class QuestionBank {
    var list = [Question]()
    init() {
        list.append(Question(text: "Valentine\'s day is banned in Saudi Arabia.", correctAns: true))
        
        list.append(Question(text: "A slug\'s blood is green.", correctAns: true))
        
        list.append(Question(text: "Approximately one quarter of human bones are in the feet.", correctAns: true))
        
        list.append(Question(text: "The total surface area of two human lungs is approximately 70 square metres.", correctAns: true))
        
        list.append(Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", correctAns: true))
        
        list.append(Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", correctAns: false))
        
        list.append(Question(text: "It is illegal to pee in the Ocean in Portugal.", correctAns: true))
        
        list.append(Question(text: "You can lead a cow down stairs but not up stairs.", correctAns: false))
           
        list.append(Question(text: "Google was originally called \"Backrub\".", correctAns: true))
        
        list.append(Question(text: "Buzz Aldrin\'s mother\'s maiden name was \"Moon\".", correctAns: true))

        list.append(Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", correctAns: false))

        list.append(Question(text: "No piece of square dry paper can be folded in half more than 7 times.", correctAns: false))
        
        list.append(Question(text: "Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.", correctAns: true))
    }
}

