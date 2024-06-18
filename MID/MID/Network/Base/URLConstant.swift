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
    static let duplicate = "/api/v1/auth/duplicate-check"
    static let loginOut =  "/api/v1/user/account/logout"
    static let userDelete = "/api/v1/user/account/delete"
    
    // MARK: - MyPage
    
    static let fcm = "/api/v1/fcm/push"
    static let editUser = "/api/v1/user/details/edit"
    static let detailsUser = "/api/v1/user/details"
    static let interest = "/api/v1/interest/update"
    static let setInterest = "/api/v1/interest/register"
    static let usetInfo = "/api/v1/user/info"
    
    // MARK: - Image
    
    static let postImage = "/api/v1/s3/upload"
    static let delImage = "/ap1/v1/s3/delete"
    
    // MARK: - Event
    
    static let search = "/api/v1/event/search"
    static let eventDetail = "/api/v1/event/detail?id={id}"
    static let displayEvent = "/api/v1/event/display"
    static let randomEvent = "/api/v1/display/random"
    
    // MARK: - SMS
    
    static let sendSMS = "/api/v1/sms-certification/send"
    static let confirmSMS = "/api/v1/sms-certification/confirm"
    
    // MARK: - Todo
    
    static let todayTodo = "/api/v1/todo/today"
    static let monthTodo = "/api/v1/todo/month"
}

