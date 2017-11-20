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
            return ["name": "Shashi", "location": "Embassy"]
        }))
        
        embassyapp.launch()
        embassyapp.buttons["MakeNetworkRequest"].tap()
        wait(forElement: embassyapp.staticTexts["Embassy"], timeout: 3)
        XCTAssert(embassyapp.staticTexts["Embassy"].exists)
    }
}
