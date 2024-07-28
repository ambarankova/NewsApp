//
//  NewsRespondObject.swift
//  NewsApp
//
//  Created by Анастасия Ахановская on 23.07.2024.
//

import Foundation

struct NewsRespondObject: Codable {
    let totalResults: Int
    let articles: [ArticleRespondObject]
    
    enum CodingKeys: CodingKey {
        case totalResults
        case articles
    }
}
