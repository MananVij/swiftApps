//
//  NewsManager.swift
//  NewsApp
//
//  Created by Manan Vij on 05/08/23.
//

import Foundation
protocol NewsManagerDelegate {
    func didUpdateNews(news: NewsModel)
}
class NewsManager {
    
    var delegate: NewsManagerDelegate?
    private let apiKey = "69e8baecda3449cdbb52b58c69b40693"
    private let baseURL = "https://newsapi.org/v2/everything"
    
//    MARK: - Fetch News
    func fetchNews(query: String) {
        let urlString = "\(baseURL)?q=\(query)&apiKey=\(apiKey)"
        performRequest(url: urlString)
    }
    
//    MARK: - Forming URL Session
    private func performRequest(url: String) {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("error in initiating task: \(error!)")
                    return
                }
                if let safeData = data {
                    if let news = self.parseData(data: safeData) {
                        self.delegate?.didUpdateNews(news: news)
                    }
                }
                
            }
            task.resume()
        }
    }
    
//    MARK: - Parsing JSON Data
    private func parseData(data: Data) -> NewsModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(NewsData.self, from: data)
            let news = NewsModel(articles: decodedData.articles)
            return news
            
        }
        catch {
            print("error while decoding data: \(error)")
            return nil
        }
    }
    
    
}
