//
//  LoginResponseDto.swift
//  MID
//
//  Created by 천성우 on 6/4/24.
//

import Foundation

struct LoginResponseDto: Codable {
    let nickname: String
    let memberId: Int
    let accessToken: String
    let refreshToken: String
}
