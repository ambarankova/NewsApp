//
//  ArticleRespondObject.swift
//  NewsApp
//
//  Created by Анастасия Ахановская on 23.07.2024.
//

import Foundation

struct ArticleRespondObject: Codable {
    let title: String
    let description: String
    let urlToImage: String
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case urlToImage
        case date = "publishedAt"
    }
}
