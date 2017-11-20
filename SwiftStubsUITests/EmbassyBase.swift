//
//  EmbassyBase.swift
//  SwiftStubsUITests
//
//  Created by Shashikant Jagtap on 19/11/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import Foundation
import XCTest

import Embassy
import EnvoyAmbassador

class EmbassyBase: XCTestCase {
    let port = 8080
    var router: Router!
    var eventLoop: EventLoop!
    var server: HTTPServer!
    var embassyapp: XCUIApplication!
    
    var eventLoopThreadCondition: NSCondition!
    var eventLoopThread: Thread!
    
    override func setUp() {
        super.setUp()
        setupWebApp()
        setupApp()
    }
    
    // setup the Embassy web server for testing
    private func setupWebApp() {
        eventLoop = try! SelectorEventLoop(selector: try! KqueueSelector())
        router = DefaultRouter()
        server = DefaultHTTPServer(eventLoop: eventLoop, port: port, app: router.app)
        
        // Start HTTP server to listen on the port
        try! server.start()
        
        eventLoopThreadCondition = NSCondition()
        eventLoopThread = Thread(target: self, selector: #selector(runEventLoop), object: nil)
        eventLoopThread.start()
    }
    
    // set up XCUIApplication
    private func setupApp() {
        embassyapp = XCUIApplication()
        embassyapp.launchEnvironment = ["BASEURL" : "http://localhost:8080"]
    }
    
    override func tearDown() {
        super.tearDown()
        embassyapp.terminate()
        server.stopAndWait()
        eventLoopThreadCondition.lock()
        eventLoop.stop()
        while eventLoop.running {
            if !eventLoopThreadCondition.wait(until: (NSDate().addingTimeInterval(10) as? Date)!) {
                fatalError("Join eventLoopThread timeout")
            }
        }
    }
    
    @objc private func runEventLoop() {
        eventLoop.runForever()
        eventLoopThreadCondition.lock()
        eventLoopThreadCondition.signal()
        eventLoopThreadCondition.unlock()
    }
}
