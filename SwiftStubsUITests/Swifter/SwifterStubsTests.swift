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
    
    let swifterapp = XCUIApplication()
    let dynamicStubs = HTTPDynamicStubs()
    
    override func setUp() {
        super.setUp()
        dynamicStubs.setUp()
        swifterapp.launchEnvironment = ["BASEURL" : "http://localhost:8080"]
        continueAfterFailure = false
    }
    
    override func tearDown() {
     
        super.tearDown()
         dynamicStubs.tearDown()
    }
    
    func testWithSwifterStubs() {
        swifterapp.launch()
        dynamicStubs.setupStub(url: "/users/shashikant86", filename: "Feed", method: .GET)
        swifterapp.buttons["MakeNetworkRequest"].tap()
        wait(forElement: swifterapp.staticTexts["Swifter"], timeout: 3)
        XCTAssert(swifterapp.staticTexts["Swifter"].exists)
    }
    
}
