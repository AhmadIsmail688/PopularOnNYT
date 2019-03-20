//
//  NetworkManager.swift
//  Popular on NYT
//
//  Created by Ahmad Ismail on 3/20/19.
//  Copyright © 2019 Ahmad Ismail. All rights reserved.
//

import Moya

struct NetworkManager {
    
    static let mostPopularProvider =
        MoyaProvider<MostPopularApi>(plugins: [NetworkLoggerPlugin(verbose: true)])

    static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    static func getArticles(
        period: ArticlesPeriod,
        success: @escaping ([Article]) -> (),
        failure: @escaping (String) -> ()
        ) {
        
        mostPopularProvider.request(.getArticles(period: period)) { result in
            switch result {
            case .success(let response):
                guard response.statusCode == 200 else {
                    failure("Couldn't get articles data")
                    return
                }
                
                do {
                    let articlesResponse = try jsonDecoder.decode(ArticlesResponse.self, from: response.data)
                    success(articlesResponse.results)
                } catch {
                    print("parse error: ", error)
                    failure(error.localizedDescription)
                }
                
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
}
