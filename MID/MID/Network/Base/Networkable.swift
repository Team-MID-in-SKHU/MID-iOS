//
//  Networkable.swift
//  MID
//
//  Created by 천성우 on 6/4/24.
//

import Foundation

import Moya

protocol Networkable {
    associatedtype Target: TargetType
    
    static func makeProvider() -> MoyaProvider<Target>
}

extension Networkable {
    
    static func makeProvider() -> MoyaProvider<Target> {
        let authPlugin = AccessTokenPlugin { _ in
            return "🔐 With Authorization"
        }
        let loggerPlugin = NetworkLoggerPlugin()
        
        return MoyaProvider<Target>(plugins: [authPlugin, loggerPlugin])
    }
}
