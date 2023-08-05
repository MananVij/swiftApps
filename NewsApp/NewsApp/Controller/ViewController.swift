//
//  ViewController.swift
//  NewsApp
//
//  Created by Manan Vij on 05/08/23.
//

import UIKit
//api key: 69e8baecda3449cdbb52b58c69b40693
class ViewController: UIViewController {
    
    
    let newsManager = NewsManager()

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var headlineText: UITextField!
    @IBOutlet weak var authorText: UITextField!
    @IBOutlet weak var searchTextField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        newsManager.delegate = self
        // Do any additional setup after loading the view.
    }
}

//MARK: - SearchBarmethod
extension ViewController: UISearchBarDelegate, UITextViewDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text {
            newsManager.fetchNews(query: query)
        }
        searchBar.endEditing(true)
    }
}

//MARK: - NewsManagerDelegate
extension ViewController: NewsManagerDelegate{
    func didUpdateNews(news: NewsModel) {
        DispatchQueue.main.async {
            self.authorText.text = "By: \(news.articles[0].author!)"
            self.headlineText.text = news.articles[0].title
            self.searchTextField.text = news.articles[0].description!
            self.loadImage(stringUrl: news.articles[0].urlToImage!)
        }
        
    }
}

//MARK: - Loading News Article Image From URL
extension ViewController {
    private func loadImage(stringUrl: String) {
       
        DispatchQueue.global().async { [weak self] in
            let url = URL(string: stringUrl)
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

