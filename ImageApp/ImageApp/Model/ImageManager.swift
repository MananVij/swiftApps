//
//  ImageManager.swift
//  ImageApp
//
//  Created by Manan Vij on 04/08/23.
//

import Foundation
import UIKit

protocol ImageManagerDelegate {
    func didUpdateImage(image: ImageModel)
}
class ImageManager {
    
    private let baseURL = "https://api.unsplash.com/photos?client_id=ugp5ckBK-WsQql7_3QE85R3s5318nQXEWIjo0KNZ_dk"
    private var image: UIImage?
    var imageUrlArray: ImageModel?
    var delegate: ImageManagerDelegate?
    
    func fetchImageURLs() {
        if let url = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    print("Error while creating task: \(error!)")
                    return
                }
                if let safeData = data {
                    if let parsedData = self.parseData(imageData: safeData) {
                        self.imageUrlArray = parsedData
                        self.delegate?.didUpdateImage(image: parsedData)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseData(imageData: Data) -> ImageModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode([ImageData].self, from: imageData)
            
            let imageObj = decodedData.map{$0.urls}
            let image = ImageModel(url: imageObj)
            return image
            
        } catch {
            print(error)
            return nil
        }
    }
}
