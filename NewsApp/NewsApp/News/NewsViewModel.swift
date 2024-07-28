//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Анастасия Ахановская on 26.07.2024.
//

import Foundation

protocol NewsViewModelProtocol {
    var title: String { get }
    var description: String { get }
    var date: String { get }
    var imageData: Data? { get }
}

final class NewsViewModel: NewsViewModelProtocol {
    let imageData: Data?
    let title: String
    let description: String
    let date: String
    
    init(article: ArticleCellViewModel) {
        title = article.title
        description = article.description
        date = article.date
        imageData = article.imageData
    }
}
