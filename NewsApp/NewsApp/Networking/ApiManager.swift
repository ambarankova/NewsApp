//
//  ApiManager.swift
//  NewsApp
//
//  Created by Анастасия Ахановская on 24.07.2024.
//

import Foundation

final class ApiManager {
    private static let apiKey = "07065fca12844b40a24e30dbf1740fa4"
    private static let baseUrl = "https://newsapi.org/v2/"
    private static let path = "everything"
    
    static func getNews(completion: @escaping (Result<[ArticleRespondObject], Error>) -> ()) {
        let stringUrl = baseUrl + path + "?sources=bbc-news&language=en" + "&apiKey=\(apiKey)"
        
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            handleRespond(data: data, error: error, completion: completion)
        }
        
        session.resume()
    }
    
    static func getImageData(url: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                completion(.success(data))
            }
            
            if let error = error {
                completion(.failure(error))
            }
        }
        
        session.resume()
    }
    
    private static func handleRespond(data: Data?, error: Error?, completion: @escaping (Result<[ArticleRespondObject], Error>) -> ()) {
        
        if let error = error {
            completion(.failure(NetworkingError.networkingError(error)))
        } else if let data = data {
            do {
                let model = try JSONDecoder().decode(NewsRespondObject.self,
                                                     from: data)
                completion(.success(model.articles))
            }
            catch let decodeError {
                completion(.failure(decodeError))
            }
        } else {
            completion(.failure(NetworkingError.unknown))
        }
    }
}
