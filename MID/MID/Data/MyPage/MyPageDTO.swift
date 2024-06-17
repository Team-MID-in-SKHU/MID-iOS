//
//  MyPageDTO.swift
//  MID
//
//  Created by 천성우 on 6/17/24.
//

import Foundation


struct FCMRequestBody: Codable {
    let targetToken, title, body: String
}

struct FCMResponseBody: Codable {}

struct UserDetailResponseBody: Codable {
    let studentNo, name, phoneNumber, department: String
    let roleType: String
    let category: [String]
}

struct EditUserDetailRequeestBody: Codable {
    let name, phoneNumber: String
}

struct UserInterestUpDateBody: Codable {
    let interestCategoryList: [String]
}

struct UserResponseBody : Codable {
    let studentNo, name, department, roleType: String
}
