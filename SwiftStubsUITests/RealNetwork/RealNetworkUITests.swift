//
//  SwiftStubsUITests.swift
//  SwiftStubsUITests
//
//  Created by Shashikant Jagtap on 16/11/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import XCTest

extension XCTestCase {
    func wait(forElement element: XCUIElement, timeout: TimeInterval) {
        let predicate = NSPredicate(format: "exists == 1")
        // This will make the test runner continously evalulate the
        // predicate, and wait until it matches.
        expectation(for: predicate, evaluatedWith: element)
        waitForExpectations(timeout: timeout)
    }
}

class RealNetworkUITests: XCTestCase {
    
//    var realapp: XCUIApplication!
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    

    func testWithRealEndPoints() {
        let realapp = XCUIApplication()
        realapp.launchEnvironment = ["BASEURL" : "https://api.github.com"]
        realapp.launch()
        realapp.buttons["MakeNetworkRequest"].tap()
        let location = realapp.staticTexts["London"]
        wait(forElement: location, timeout: 3)
        XCTAssertTrue(location.exists)
        
    }
    
}
