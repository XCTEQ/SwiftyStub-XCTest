//
//  SBTUITest.swift
//  SwiftStubsUITests
//
//  Created by Shashikant Jagtap on 20/11/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import Foundation

import XCTest
import SBTUITestTunnel

class SBTUITest: XCTestCase {
    
    var sbtapp: SBTUITunneledApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        sbtapp = SBTUITunneledApplication()
        sbtapp.launchEnvironment = ["BASEURL" : "http://localhost:8080"]
        sbtapp.launchTunnel()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        sbtapp.stubRequestsRemoveAll()
    }
    
    func testSBTStubs() {
        
        _ = sbtapp.stubRequests(matching: SBTRequestMatch.init(url: "http://localhost:8080/users/shashikant86"), response: SBTStubResponse(response: ["location": "SBT"]))
        sbtapp.buttons["MakeNetworkRequest"].tap()
        wait(forElement: sbtapp.staticTexts["SBT"], timeout: 3)
        XCTAssert(sbtapp.staticTexts["SBT"].exists)
        
    }
    
}

