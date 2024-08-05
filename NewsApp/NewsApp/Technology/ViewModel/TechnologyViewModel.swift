//
//  TechnologyViewModel.swift
//  NewsApp
//
//  Created by Анастасия Ахановская on 05.08.2024.
//

import Foundation

final class TechnologyViewModel: NewsListViewModel {
    override func loadData(searchText: String?) {
        super.loadData(searchText: searchText)
        
        ApiManager.getNews(about: .Technology, page: page, searchText: searchText) { [weak self] result in
            self?.handleResult(result)
        }
    }
    
    override func convertToCellViewModel(_ articles: [ArticleRespondObject]) {
        var viewModels = articles.map { ArticleCellViewModel(article: $0) }
        
        if sections.isEmpty {
            let firstSection = TableCollectionViewSection(items: [viewModels.removeFirst()])
            let secondSection = TableCollectionViewSection(items: viewModels)
            sections = [firstSection, secondSection]
        } else {
            sections[1].items += viewModels
        }
    }
}
