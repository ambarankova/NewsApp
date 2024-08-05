//
//  GeneralViewModel.swift
//  NewsApp
//
//  Created by Анастасия Ахановская on 11.07.2024.
//

import Foundation

final class GeneralViewModel: NewsListViewModel {
    override func loadData(searchText: String?) {
        super.loadData(searchText: searchText)
        
        ApiManager.getNews(about: .Everything, page: page, searchText: searchText) { [weak self] result in
            self?.handleResult(result)
        }
    }
}
