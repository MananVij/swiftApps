//
//  ViewController.swift
//  ImageApp
//
//  Created by Manan Vij on 04/08/23.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var imageManager = ImageManager()
    var imageUrlArray: ImageModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageManager.fetchImageURLs()
        imageUrlArray = imageManager.imageUrlArray
        loadImage()
        imageManager.delegate = self
        
        // Do any additional setup after loading the view.
    }
    @IBAction func getImagePressed(_ sender: UIButton) {
        loadImage()
    }
    

}

// MARK: -ImageManagerDelegate
extension ViewController: ImageManagerDelegate {
    func didUpdateImage(image: ImageModel) {
        imageUrlArray = image
        loadImage()
    }
    
    func loadImage() {
        if let imageUrlArray {
            let randomIndex = Int.random(in: 0..<imageUrlArray.url.count)
            DispatchQueue.global().async { [weak self] in
                let url = URL(string: imageUrlArray.url[randomIndex].raw)
                if let data = try? Data(contentsOf: url!) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.imageView.image = image
                        }
                    }
                }
            }
        }
    }
 
}
