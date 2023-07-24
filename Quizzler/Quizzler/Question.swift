//
//  Question.swift
//  Quizzler
//
//  Created by Manan Vij on 19/07/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation
class Question {
    let question : String
    let answer : Bool
    
    init(text: String, correctAns: Bool){
        question = text
        answer = correctAns
    }
}
