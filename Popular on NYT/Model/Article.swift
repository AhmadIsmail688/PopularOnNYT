//
//  Article.swift
//  Popular on NYT
//
//  Created by Ahmad Ismail on 3/20/19.
//  Copyright © 2019 Ahmad Ismail. All rights reserved.
//

import Foundation

struct ArticlesResponse: Decodable {
    var results: [Article]
}

struct Article: Decodable {
    var title: String
    var abstract: String
    var publishedDate: String
    var media: [ArticleMedia]
}

struct ArticleMedia: Decodable {
    var mediaMetadata: [ArticleMediaMetaData]
}

struct ArticleMediaMetaData: Decodable {
    var url: String
    var format: String
}

