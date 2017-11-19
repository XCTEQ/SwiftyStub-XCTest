//
//  DefaultRouter.swift
//  SwiftStubsUITests
//
//  Created by Shashikant Jagtap on 19/11/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import Foundation
import Embassy
import EnvoyAmbassador


class DefaultRouter: Router {
    static let fetchUsersPath = "/users/shashikant86"
    override init() {
        super.init()
        self[DefaultRouter.fetchUsersPath] = DelayResponse(JSONResponse(handler: ({ environ -> NSDictionary in
            return ["name": "Shashi", "location": "Paris"]
        })))
    }
}


