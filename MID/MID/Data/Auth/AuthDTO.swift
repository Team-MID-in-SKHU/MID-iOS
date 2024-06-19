//
//  AuthDTO.swift
//  MID
//
//  Created by 천성우 on 6/10/24.
//

import Foundation


struct SignUpRequestBody: Codable {
    var studentNo, password, name, department: String
    var phoneNumber, fcmToken, roleType: String
}


struct SignUpResponseBody: Codable {}


struct LoginRequestBody: Codable {
    var studentNo, password, fcmToken: String
}


struct LoginResponseBody: Codable {
    let accessToken: String
    let refreshToken: String
}

struct DuplicateRequestBody: Codable {
    var studentNo: String
}

struct DuplicateResponseBody: Codable {
    var studentNo: Bool
}

struct LogOutResponseBody: Codable {
    let text: String
}

struct UserDeleteResponseBody: Codable {}
