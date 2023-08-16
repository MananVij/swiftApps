//
//  TableViewController.swift
//  NewsApp
//
//  Created by Manan Vij on 08/08/23.
//

import UIKit
import MBProgressHUD

class NewsViewController: UITableViewController {
    
    var data: NewsModel?
    
    let newsManager = NewsManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        newsManager.delegate = self
        tableView.rowHeight = 70.0
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data?.articles.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.section
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)
        cell.textLabel?.text = data?.articles[index].title
        cell.detailTextLabel?.text = data?.articles[index].description
//        if let urlImage = data?.articles[index].urlToImage {
//            cell.imageView?.image = loadImage(stringUrl: urlImage)
//        }
        return cell
    }
}

extension NewsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text {
            newsManager.fetchNews(query: query)
            showIndicator()
        }
    }
}

extension NewsViewController: NewsManagerDelegate {
    func didUpdateNews(news: NewsModel) {
        DispatchQueue.main.async {
            self.data = news
            self.hideIndicator()
            self.tableView.reloadData()
        }
    }
}

extension NewsViewController {
    func loadImage(stringUrl: String) -> UIImage? {
        var descImage: UIImage?
        
        DispatchQueue.global().async { [weak self] in
            let url = URL(string: stringUrl)
            if let data = try? Data(contentsOf: url!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        descImage = image
                    }
                }
            }
        }
        return descImage
    }
}

extension NewsViewController {
    func showIndicator() {
        let Indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
        Indicator.label.text = "Loading"
        Indicator.isUserInteractionEnabled = false
        Indicator.show(animated: true)
    }
    func hideIndicator() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
