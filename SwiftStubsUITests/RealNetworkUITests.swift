//
//  SwiftStubsUITests.swift
//  SwiftStubsUITests
//
//  Created by Shashikant Jagtap on 16/11/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import XCTest



class RealNetworkUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func waitForElementToAppear(_ element: XCUIElement) -> Bool {
        let predicate = NSPredicate(format: "exists == true")
        let exp = expectation(for: predicate, evaluatedWith: element,
                                      handler: nil)
        
        let result = XCTWaiter().wait(for: [exp], timeout: 5)
        return result == .completed
    }
    
    func testWithRealEndPoints() {
        XCUIApplication().launch()
        XCUIApplication().buttons["MakeNetworkRequest"].tap()
        let location = XCUIApplication().staticTexts["London"]
        if waitForElementToAppear(location) {
            XCTAssertTrue(location.exists)
        }
    }
    
}
