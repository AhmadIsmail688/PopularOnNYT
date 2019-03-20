//
//  ArticlesApi.swift
//  Popular on NYT
//
//  Created by Ahmad Ismail on 3/20/19.
//  Copyright © 2019 Ahmad Ismail. All rights reserved.
//

import Moya

enum MostPopularApi {
    case getArticles(period: ArticlesPeriod)
}

extension MostPopularApi: TargetType {
    
    var apiKey: String {
        return "kmMhZXUycFU2dI1M5qPlNcoHZp6utITH"
    }
    
    var baseURL: URL {
        let urlString = "https://api.nytimes.com/svc/mostpopular/v2/"
        guard let url = URL(string: urlString) else {
            fatalError("base URL could not be configured")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getArticles(let period):
            return "viewed/\(period.rawValue).json"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return Task.requestParameters(
            parameters: ["api-key" : apiKey],
            encoding: URLEncoding.default
        )
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
