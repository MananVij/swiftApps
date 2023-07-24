//
//  ViewController.swift
//  calculator-app
//
//  Created by Manan Vij on 19/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ansText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func oneButton(_ sender: Any) {
        
        ansText.text = String("\(ansText.text ?? "No Text")1")
    }
    
}

