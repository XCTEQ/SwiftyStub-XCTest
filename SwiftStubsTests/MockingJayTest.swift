//
//  MockingJayTest.swift
//  SwiftStubsTests
//
//  Created by Shashikant Jagtap on 18/11/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import XCTest
@testable import SwiftStubs
import Mockingjay

class MockingJayTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
       
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testStubWithMockingjay() {
        guard let gitUrl = URL(string: "https://api.github.com/users/shashikant86") else { return }
        
        let path = Bundle(for: type(of: self)).path(forResource: "Feed", ofType: "json")!
    
        let data = NSData(contentsOfFile: path)!
    
        self.stub(uri("https://api.github.com/users/shashikant86"), jsonData(data as Data))
        
        let promise = expectation(description: "Simple Request")
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                if let result = json as? NSDictionary {
                    XCTAssertTrue(result["name"] as! String == "Shashi")
                    XCTAssertTrue(result["location"] as! String == "Paris")
                    promise.fulfill()
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
}
