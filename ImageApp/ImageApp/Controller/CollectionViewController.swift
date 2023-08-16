//
//  CollectionViewController.swift
//  ImageApp
//
//  Created by Manan Vij on 09/08/23.
//

import UIKit
import MBProgressHUD

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    var imageUrlArray: ImageModel?
    

    @IBOutlet weak var collectionImageView: UIImageView!
    
    let imageManager = ImageManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        imageManager.fetchImageURLs()
//        showIndicator()
        imageManager.delegate = self
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return Int(imageUrlArray?.url.count ?? 0/2)
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        print(indexPath.row, indexPath.section)
//        let mystr = String(imageUrlArray?.url[indexPath.row])
        
        if let urlString = imageUrlArray?.url[indexPath.section].raw {
            collectionImageView.image = loadImage(urlString)
//            cell.image = loadImage(urlString)
        }
        return cell
    }

}

extension CollectionViewController: ImageManagerDelegate {
    func didUpdateImage(image: ImageModel) {
        imageUrlArray = image
    }
    
    func loadImage(_ url: String) -> UIImage? {
        var imageView: UIImage?
        DispatchQueue.global().async { [weak self] in
            let url = URL(string: url)
            if let data = try? Data(contentsOf: url!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.hideIndicator()
                        imageView = image
                    }
                }
            }
        }
        return imageView
    }
}

extension CollectionViewController {
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
