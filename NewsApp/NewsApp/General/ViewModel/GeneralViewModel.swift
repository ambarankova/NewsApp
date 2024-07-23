//
//  GeneralViewModel.swift
//  NewsApp
//
//  Created by Анастасия Ахановская on 11.07.2024.
//

import Foundation

protocol GeneralViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    
    var numberOfCells: Int { get }
    
    func getArticle(for row: Int) -> ArticleCellViewModel
}

final class GeneralViewModel: GeneralViewModelProtocol {
    var reloadData: (() -> Void)?
    
    // MARK: - Properties
    var numberOfCells: Int {
        articles.count
    }
    
    private var articles: [ArticleRespondObject] = [] {
        didSet {
            reloadData?()
        }
    }
    
    init() {
        loadData()
    }
    
    func getArticle(for row: Int) -> ArticleCellViewModel {
        let article = articles[row]
        
        return ArticleCellViewModel(article: article)
    }
    
    private func loadData() {
        // TODO: - func loadData
        
        setupMockObjects()
    }
    
    private func setupMockObjects() {
        articles = [
            ArticleRespondObject(title: "First object title", description: "First object description in the mock object", urlToImage: "...", publishedAt: "01.01.2001"),
            ArticleRespondObject(title: "Second object title", description: "Second object description in the mock object", urlToImage: "...", publishedAt: "01.01.2001"),
            ArticleRespondObject(title: "Third object title", description: "Third object description in the mock object", urlToImage: "...", publishedAt: "01.01.2001"),
            ArticleRespondObject(title: "Fourth object title", description: "Fourth object description in the mock object", urlToImage: "...", publishedAt: "01.01.2001"),
            ArticleRespondObject(title: "Fifth object title", description: "Fifth object description in the mock object", urlToImage: "...", publishedAt: "01.01.2001")
            ]
    }
}
