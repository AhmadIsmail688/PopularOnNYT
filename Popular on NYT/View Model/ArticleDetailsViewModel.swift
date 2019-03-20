//
//  ArticleDetailsViewModel.swift
//  Popular on NYT
//
//  Created by Ahmad Ismail on 3/20/19.
//  Copyright © 2019 Ahmad Ismail. All rights reserved.
//

import Foundation

struct ArticleDetailsViewModel {
    
    let title: String
    let byline: String
    let publishedDate: String
    let abstract: String
    let imageUrlString: String?
    
    init(article: Article) {
        
        self.title = article.title
        self.byline = article.byline
        self.publishedDate = article.publishedDate
        self.abstract = article.abstract
        
        let mediaMetaData = article.media.first?.mediaMetadata
        self.imageUrlString = mediaMetaData?.filter{
            $0.format == "mediumThreeByTwo440"
            }.first?.url
    }
    
}
