//
//  VaporStubTest.swift
//  SwiftStubsUITests
//
//  Created by Shashikant Jagtap on 19/11/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import XCTest

class VaporStubTest: XCTestCase {
    let vaporapp = XCUIApplication()
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        vaporapp.launchEnvironment = ["BASEURL" : "http://localhost:8080"]
        vaporapp.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testVaporStubs() {
        vaporapp.buttons["MakeNetworkRequest"].tap()
        sleep(3) //Yes how UITest Work ! Maybe replace with XCTWaiter and Predicates 
        XCTAssert(app.staticTexts["SD"].exists)
    }
}
