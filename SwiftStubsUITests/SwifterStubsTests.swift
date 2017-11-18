//
//  SwifterStubs.swift
//  SwiftStubsUITests
//
//  Created by Shashikant Jagtap on 18/11/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import XCTest
import Swifter

class SwifterStubsTests: XCTestCase {
    
    let app = XCUIApplication()
    let dynamicStubs = HTTPDynamicStubs()
    
    override func setUp() {
        super.setUp()
        dynamicStubs.setUp()
        continueAfterFailure = false
    
    }
    
    override func tearDown() {
     
        super.tearDown()
         dynamicStubs.tearDown()
    }
    
    func testWithSwifterStubs() {
        app.launch()
        dynamicStubs.setupStub(url: "/users/shashikant86", filename: "Feed", method: .GET)
        app.buttons["MakeNetworkRequest"].tap()
        sleep(3)
        let location = XCUIApplication().staticTexts["Paris"]
        XCTAssertTrue(location.exists)
    }
    
}
