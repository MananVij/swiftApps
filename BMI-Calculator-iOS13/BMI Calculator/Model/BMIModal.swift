//
//  BMIModal.swift
//  BMI Calculator
//
//  Created by Manan Vij on 21/07/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
class Person {
    var height: Float?
    var weight: Float?
    
    init() {
        self.height = nil
        self.weight = nil
    }
    
    func setHeight(_ height: Float) {
        self.height = height
    }
    
    func setWeight(_ weight: Float) -> Void {
        self.weight = weight
    }
    
    func findBMI() -> Float{
    return weight!/(height! * height!)
    }
}
