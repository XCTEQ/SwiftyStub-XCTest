//
//  EmbassyStubTest.swift
//  SwiftStubsUITests
//
//  Created by Shashikant Jagtap on 19/11/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import XCTest
import EnvoyAmbassador
import Embassy

class EmbassyStubTest: EmbassyBase {
    

    func testEmbassyStub() {
        
        router[DefaultRouter.fetchUsersPath] = DelayResponse(JSONResponse(handler: { _ in
            return ["name": "Shashi", "location": "MockedCity"]
        }))
        
        embassyapp.launch()
        embassyapp.buttons["MakeNetworkRequest"].tap()
        sleep(3) //Yes how UITest Work ! Maybe replace with XCTWaiter and Predicates 
        XCTAssert(embassyapp.staticTexts["MockedCity"].exists)
    }
}
