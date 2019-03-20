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
    var byline: String
    var abstract: String
    var publishedDate: String
    var media: [ArticleMedia]
}

struct ArticleMedia: Decodable {
    var mediaMetadata: [ArticleMediaMetaData]
    
    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mediaMetadata = try container.decode([ArticleMediaMetaData].self, forKey: .mediaMetadata)
    }
    
    init(mediaMetaData: [ArticleMediaMetaData]) {
        self.mediaMetadata = mediaMetaData
    }
    
}

struct ArticleMediaMetaData: Decodable {
    var url: String
    var format: String
}

