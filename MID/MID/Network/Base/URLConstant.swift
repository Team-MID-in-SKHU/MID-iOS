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
    static let signUp = "/api/v1/auth/signUp"
    static let login = "/api/v1/auth/login"
    static let duplicate = "/api/v1/auth/duplicate-check?studentNo={studentNo}"
    static let loginOut =  "/api/v1/user/account/logout"
    static let userDelete = "/api/v1/user/account/delete"
    
    // MARK: - MyPage
    
    static let fcm = "/api/v1/fcm/push"
    static let editUser = "/api/v1/user/details/edit"
    static let detailsUser = "/api/v1/user/details"
    static let interest = "/api/v1/interest/update"
    static let setInterest = "/api/v1/interest/register"
    static let usetInfo = "/api/v1/user/info"
}

