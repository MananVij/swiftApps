//
//  NewsData.swift
//  NewsApp
//
//  Created by Manan Vij on 05/08/23.
//

import Foundation
// MARK: - NewsData
struct NewsData: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let author, title, description: String?
    let urlToImage: String?
    let content: String?
}
