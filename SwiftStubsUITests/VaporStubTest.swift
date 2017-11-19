//
//  VaporStubTest.swift
//  SwiftStubsUITests
//
//  Created by Shashikant Jagtap on 19/11/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import XCTest

class VaporStubTest: XCTestCase {
    let app = XCUIApplication()
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app.launchEnvironment = ["BASEURL" : "http://localhost:8080"]
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testVaporStubs() {
        app.buttons["MakeNetworkRequest"].tap()
        XCTAssert(app.staticTexts["SD"].exists)
    }
}
