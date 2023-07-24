//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
   
    @IBOutlet weak var heightText: UILabel!
    @IBOutlet weak var weightText: UILabel!
    var person = Person()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        person.setHeight(round(sender.value * 10)/10.0)
        updateUI("height")
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        person.setWeight(round(sender.value * 10)/10.0)
        updateUI("weight")
    }
    @IBAction func calculateButton(_ sender: Any) {
        if person.height != nil && person.weight != nil {
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.bmiValue = String(format: "%.1f", person.findBMI())
        }
    }
    
    func updateUI(_ updation: String) {
        if updation == "height" {
            heightText.text = "\(person.height!)m"
        }
        else if updation == "weight" {
            weightText.text = "\(person.weight!)Kg"
        }
            
    }
}

