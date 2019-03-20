//
//  Popular_on_NYTUITests.swift
//  Popular on NYTUITests
//
//  Created by Ahmad Ismail on 3/20/19.
//  Copyright © 2019 Ahmad Ismail. All rights reserved.
//

import XCTest

class Popular_on_NYTUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testTappingAnArticleOpensTheRightDetails() {
        XCUIDevice.shared.orientation = .faceUp
        
        let app = XCUIApplication()
        let listingArticleTitle = app.tables.staticTexts.matching(identifier: "ArticleTitle").element(boundBy: 0)
        listingArticleTitle.tap()
        let detailsArticleTitle = app.staticTexts["DetailsArticleTitle"]
        
        XCTAssertEqual(listingArticleTitle.label, detailsArticleTitle.label)
        
    }
    
}
