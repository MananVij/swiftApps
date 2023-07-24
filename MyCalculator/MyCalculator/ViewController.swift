//
//  ViewController.swift
//  MyCalculator
//
//  Created by Manan Vij on 21/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ans: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func numberPressed(_ sender: UIButton) {
        if ans.text == "0" {
            ans.text = "\(sender.tag)"
        }
        else {
            ans.text = "\(ans.text!)\(sender.tag)"
        }
            
    }
    func reset() {
        // resets the calci
    }
    
    
    func add(num1: Float, num2: Float) -> Float {
        return num1+num2
    }
    func sub(num1: Float, num2: Float) -> Float {
        return num1-num2
    }
    func divide(num1: Float, num2: Float) -> Float {
        return num1/num2
    }
    func multiply(num1: Float, num2: Float) -> Float {
        return num1*num2
    }
    

}

