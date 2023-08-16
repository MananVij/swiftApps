//
//  ViewController.swift
//  ImageApp
//
//  Created by Manan Vij on 04/08/23.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var imageManager = ImageManager()
    var imageUrlArray: ImageModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showIndicator()
        imageManager.fetchImageURLs()
        imageUrlArray = imageManager.imageUrlArray
        loadImage()
        imageManager.delegate = self
        
        // Do any additional setup after loading the view.
    }
    @IBAction func getImagePressed(_ sender: UIButton) {
        showIndicator()
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
                            self?.hideIndicator()
                            self?.imageView.image = image
                        }
                    }
                }
            }
        }
    }
 
}

// MARK: -Laoding Manager Delegate

extension ViewController {
    func showIndicator() {
        let indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
        indicator.label.text = "Loading"
        indicator.isUserInteractionEnabled = false
//        indicator.detailsLabel.text = "Fetching Data"
        indicator.show(animated: true)
    }
    
    func hideIndicator() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
