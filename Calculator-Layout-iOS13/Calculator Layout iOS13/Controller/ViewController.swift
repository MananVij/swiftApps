//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var calculator = CalculationLogic()    
    private var isFinishedTyingNumber: Bool = true
    private var decimalAdded: Bool = false
     var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Can't convert display label to Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTyingNumber = true
        calculator.setNumber(displayValue)
        if let title = sender.currentTitle {
            
        
            if let result = calculator.calculate(symbol: title) {
                displayValue = result
            }
//            displayValue = result
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTyingNumber {
                displayLabel.text = numValue
                isFinishedTyingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                    displayLabel.text?.append(numValue)
                }
            }
            
        }
        
    }
}
