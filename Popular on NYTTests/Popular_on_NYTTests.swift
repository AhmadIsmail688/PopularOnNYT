//
//  Popular_on_NYTTests.swift
//  Popular on NYTTests
//
//  Created by Ahmad Ismail on 3/20/19.
//  Copyright © 2019 Ahmad Ismail. All rights reserved.
//

import XCTest
@testable import Popular_on_NYT

class Popular_on_NYTTests: XCTestCase {

    override func setUp() {
    }
    
    override func tearDown() {
    }
    
    func constructTestArticle() -> Article {
        let thumbnailMetaData = ArticleMediaMetaData(
            url: "https://thumbnail.image.jpg",
            format: "Standard Thumbnail"
        )
        let mediumImageMetaData = ArticleMediaMetaData(
            url: "https://medium.image.jpg",
            format: "mediumThreeByTwo440"
        )
        let articleMedia = ArticleMedia(mediaMetaData: [thumbnailMetaData,mediumImageMetaData])
        
        let article = Article(
            title: "Article Title",
            byline: "by the author",
            abstract: "Article Abstract",
            publishedDate: "2019-03-20",
            media: [articleMedia]
        )
        return article
    }

    func testArticleViewModel() {
       
        let testArticle = constructTestArticle()
        let articleViewModel = ArticleViewModel(article: testArticle)
       
        XCTAssertEqual(testArticle.title, articleViewModel.title)
        XCTAssertEqual(testArticle.byline, articleViewModel.byline)
        XCTAssertEqual(testArticle.publishedDate, articleViewModel.publishedDate)
        
        let mediaMetaData = testArticle.media.first?.mediaMetadata
        let thumbnailUrlString = mediaMetaData?.filter{
            $0.format == "Standard Thumbnail"
            }.first?.url
        XCTAssertEqual(thumbnailUrlString, articleViewModel.thumbnailUrlString)
    }
    
    func testArticleDetailsViewModel() {
        
        let testArticle = constructTestArticle()
        let articleDetailsViewModel = ArticleDetailsViewModel(article: testArticle)
        
        XCTAssertEqual(testArticle.title, articleDetailsViewModel.title)
        XCTAssertEqual(testArticle.byline, articleDetailsViewModel.byline)
        XCTAssertEqual(testArticle.publishedDate, articleDetailsViewModel.publishedDate)
        
        let mediaMetaData = testArticle.media.first?.mediaMetadata
        let thumbnailUrlString = mediaMetaData?.filter{
            $0.format == "Standard Thumbnail"
            }.first?.url
        XCTAssertEqual(thumbnailUrlString, articleDetailsViewModel.thumbnailUrlString)
    }

    

}
