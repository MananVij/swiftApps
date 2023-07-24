//
//  ViewController.swift
//  xylophone
//
//  Created by Manan Vij on 19/07/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func notePressed(_ sender: UIButton) {
        
        guard let url = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav") else { return }
        do {
            print("before delay")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                print("After delay")
            }
 
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

