//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPecButton: UIButton!
    @IBOutlet weak var tenPecButton: UIButton!
    @IBOutlet weak var twentyPecButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var numberOfPeople = 2
    var tipPercentage = 0.10
    var totalBill = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPecButton.isSelected = false
        tenPecButton.isSelected = false
        twentyPecButton.isSelected = false
        
        sender.isSelected = true
        let tipPer = sender.titleLabel?.text!.dropLast() ?? "0.0"
        tipPercentage = Double(tipPer)!/100

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    @IBAction func calculatePressed(_ sender: Any) {
        
        let billBeforeTip = Double(billTextField.text ?? "0.0")!
        totalBill = (billBeforeTip * (1 + tipPercentage))/4
        
        self.performSegue(withIdentifier: "calculatePressed", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculatePressed" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalBill = String(format: "%.1f", totalBill)
            destinationVC.totalPeople = numberOfPeople
            destinationVC.tipPercntage = String(tipPercentage*100)
            
        }
    }
}

