//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Manan Vij on 23/07/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var bmiValue: String?
    @IBOutlet weak var bmiValueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiValueLabel.text = bmiValue

        // Do any additional setup after loading the view.
    }

    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
