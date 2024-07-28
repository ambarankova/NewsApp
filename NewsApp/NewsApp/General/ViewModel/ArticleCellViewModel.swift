//
//  ArticleCellViewModel.swift
//  NewsApp
//
//  Created by Анастасия Ахановская on 23.07.2024.
//

import Foundation

struct ArticleCellViewModel {
    let title: String
    let description: String
    let date: String
    let imageUrl: String
    var imageData: Data?
    
    init(article: ArticleRespondObject) {
        title = article.title
        description = article.description
        date = article.date
        imageUrl = article.urlToImage
    }
}
