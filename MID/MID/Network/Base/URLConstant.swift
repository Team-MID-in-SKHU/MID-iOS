//
//  URLConstant.swift
//  MID
//
//  Created by 천성우 on 6/4/24.
//

import Foundation

enum URLConstant {
    
    // MARK: - Base URL
    
    static let baseURL = Config.baseURL
    
    // MARK: - URL Path
    
    // MARK: - Auth
    
    static let socialLogin = "/api/v1/auth"
    static let tokenRefresh = "/api/v1/auth/token"
    static let bearer = "Bearer "
    static let memberWithdraw = "/api/v1/member/{memberId}"
    static let signUp = "/api/v1/auth/signUp"
    static let login = "/api/v1/auth/login"
    static let duplicate = "/api/v1/auth/duplicate-check"
}