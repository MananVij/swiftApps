//
//  NewsModel.swift
//  NewsApp
//
//  Created by Manan Vij on 05/08/23.
//

import Foundation
struct NewsModel {
    let articles: [Article]
}
struct Articles {
    let author: String?
    let title: String?
    let description: String?
    let content: String?
    let urlToImage: String?
}
