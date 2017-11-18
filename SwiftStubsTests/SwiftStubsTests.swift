//
//  SwiftStubsTests.swift
//  SwiftStubsTests
//
//  Created by Shashikant Jagtap on 16/11/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import XCTest
@testable import SwiftStubs

class SwiftStubsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGitUserData() {
        
        guard let gitUrl = URL(string: "https://api.github.com/users/shashikant86") else { return }
        let promise = expectation(description: "Simple Request")
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
    
    func testGitUserDataWithCodable() {
        
        guard let gitUrl = URL(string: "https://api.github.com/users/shashikant86") else { return }
        let promise = expectation(description: "Codable Request")
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(GitHub.self, from: data)
                XCTAssertTrue(gitData.name == "Shashikant")
                XCTAssertTrue(gitData.location == "London")
                promise.fulfill()
            } catch let err {
                print("Err", err)
            }
            }.resume()
        waitForExpectations(timeout: 10, handler: nil)
    }
}
