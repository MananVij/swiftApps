//
//  ViewController.swift
//  MagicBall
//
//  Created by Manan Vij on 19/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ansLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        // Do any additional setup after loading the view.
    }

    @IBAction func askButton(_ sender: Any) {
        updateLabel()
    }
    func updateLabel() {
        let labelarr = ["Yes", "No", "I've No Idea"]
        let labelIdx = Int.random(in: 0...2)
        ansLabel.text = labelarr[labelIdx]
    }
}

