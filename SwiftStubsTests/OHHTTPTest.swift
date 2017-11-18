//
//  OHHTTPTest.swift
//  SwiftStubsTests
//
//  Created by Shashikant Jagtap on 18/11/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import XCTest
import OHHTTPStubs

class OHHTTPTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    
    }
    
    override func tearDown() {
        super.tearDown()
        OHHTTPStubs.removeAllStubs()
    }
    
    func testStubWithOHTTPStub() {
     
        guard let gitUrl = URL(string: "https://api.github.com/users/shashikant86") else { return }
        let promise = expectation(description: "Simple Request")
        
//        stub(isHost("https://api.github.com/users/shashikant86") && isPath("/resource")) { _ in
//            guard let path = OHPathForFile("Feed.json", type(of: self)) else {
//                preconditionFailure("Could not find expected file in test bundle")
//            }
//
//            return OHHTTPStubsResponse(
//                fileAtPath: path,
//                statusCode: 200,
//                headers: [ "Content-Type": "application/json" ]
//            )
//        }
        
//        stub(isPath("https://api.github.com/users/shashikant86")) { request in
//            let stubPath = OHPathForFile("Feed.json", type(of: self))
//            return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
//        }
        
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                if let result = json as? NSDictionary {
                    XCTAssertTrue(result["name"] as! String == "Shashikant")
                    XCTAssertTrue(result["location"] as! String == "London")
                    promise.fulfill()
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
}
