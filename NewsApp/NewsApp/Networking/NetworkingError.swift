//
//  NetworkingError.swift
//  NewsApp
//
//  Created by Анастасия Ахановская on 24.07.2024.
//

import Foundation

enum NetworkingError: Error {
    case networkingError(_ code: Error)
    case unknown
}
