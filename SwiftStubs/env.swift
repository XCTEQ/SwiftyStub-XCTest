//
//  env.swift
//  SwiftStubs
//
//  Created by Shashikant Jagtap on 16/11/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import Foundation

enum Environment {
    case uitest
    case production

    
    var activeEnv: String {
        
        switch self {
        case .uitest:
            return "http://localhost:8080"
        case .production:
            return "https://api.github.com"
        }
    }



} 