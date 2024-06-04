//
//  LoginRequestDto.swift
//  MID
//
//  Created by 천성우 on 6/4/24.
//

import Foundation

struct LoginRequestDto: Codable {
    let socialPlatform: String
    let socialToken: String
    let userName: String
}
