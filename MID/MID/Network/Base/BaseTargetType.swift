//
//  BaseTargetType.swift
//  MID
//
//  Created by 천성우 on 6/4/24.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType {}

extension BaseTargetType {
    
    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
}

