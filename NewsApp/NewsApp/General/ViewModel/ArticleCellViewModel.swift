//
//  ArticleCellViewModel.swift
//  NewsApp
//
//  Created by Анастасия Ахановская on 23.07.2024.
//

import Foundation

final class ArticleCellViewModel: TableCollectionViewItemsProtocol {
    let title: String
    let description: String
    let imageUrl: String?
    var date: String
    var imageData: Data?
    
    init(article: ArticleRespondObject) {
        title = article.title
        description = article.description ?? ""
        date = article.date
        imageUrl = article.urlToImage ?? ""
        
        if let formatDate = formatDate(dateString: self.date) {
            self.date = formatDate
        }
    }
    
    private func formatDate(dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
}
