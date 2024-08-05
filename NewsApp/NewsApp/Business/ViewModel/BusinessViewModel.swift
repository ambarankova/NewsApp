//
//  BusinessViewModel.swift
//  NewsApp
//
//  Created by Анастасия Ахановская on 28.07.2024.
//

import Foundation

protocol BusinessViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var showError: ((String) -> Void)? { get set }
    var reloadCell: ((Int) -> Void)? { get set }
    
    var numberOfCells: Int { get }
    
    func getArticle(for row: Int) -> ArticleCellViewModel
}

final class BusinessViewModel: BusinessViewModelProtocol {
    var reloadCell: ((Int) -> Void)?
    var reloadData: (() -> Void)?
    var showError: ((String) -> Void)?
    
    // MARK: - Properties
    var numberOfCells: Int {
        articlesBusiness.count
    }
    
    private var articlesBusiness: [ArticleCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData?()
            }
        }
    }
    
    init() {
        loadData()
    }
    
    func getArticle(for row: Int) -> ArticleCellViewModel {
        return articlesBusiness[row]
    }
    
    private func loadData() {
        ApiManager.getNews(about: .Business) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let articles):
                self.articlesBusiness = self.convertToCellViewModel(articles)
                self.loadImage()
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showError?(error.localizedDescription)
                }
            }
        }
    }
    
    private func loadImage() {
        for (index, article) in articlesBusiness.enumerated() {
                ApiManager.getImageData(url: article.imageUrl) { [weak self] result in
                    
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let data):
                            self?.articlesBusiness[index].imageData = data
                            self?.reloadCell?(index)
                        case .failure(let error):
                            self?.showError?(error.localizedDescription)
                        }
                    }
                }
            }
    }
    
    private func convertToCellViewModel(_ articles: [ArticleRespondObject]) -> [ArticleCellViewModel] {
        return articles.map { ArticleCellViewModel(article: $0) }
    }
    
    private func setupMockObjects() {
        articlesBusiness = [
            ArticleCellViewModel(article:  ArticleRespondObject(title: "First object title", description: "First object description in the mock object", urlToImage: "...", date: "01.01.2001"))
            ]
    }
}
