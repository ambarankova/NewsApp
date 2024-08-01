//
//  TableCollectionViewSection.swift
//  NewsApp
//
//  Created by Анастасия Ахановская on 29.07.2024.
//

import Foundation

protocol TableCollectionViewItemsProtocol { }

struct TableCollectionViewSection {
    var title: String?
    var items: [TableCollectionViewItemsProtocol]
}
