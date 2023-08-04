//
//  CalculationLogic.swift
//  Calculator Layout iOS13
//
//  Created by Manan Vij on 04/08/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
struct CalculationLogic {
    
    var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let num = number {
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return num * -1
            case "%":
                return num * 0.01
            case "=":
                return performTwoNumCalculation(n2: num)
            default:
                intermediateCalculation = (n1: num, calcMethod: symbol)
            }
        }
        return nil
    }
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
            let oper = intermediateCalculation?.calcMethod {
            switch oper {
            case "+":
                return n1+n2
            case "-":
                return n1-n2
            case "×":
                return n1*n2
            case "÷":
                return n1/n2
            default:
                fatalError("Cant perform calculation")
            }
        }
        return nil
    }
}
