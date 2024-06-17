//
//  AuthDTO.swift
//  MID
//
//  Created by 천성우 on 6/10/24.
//

import Foundation


struct SignUpRequestBody: Codable {
    let studentNo, password, name, department: String
    let phoneNumber, fcmToken, roleType: String
}


struct SignUpResponseBody: Codable {}


struct LoginRequestBody: Codable {
    let studentNo, password, fcmToken: String
}


struct LoginResponseBody: Codable {}

struct DuplicateResponseBody: Codable {}

struct LoginOutResponseBody: Codable {}

struct UserDeleteResponseBody: Codable {}
