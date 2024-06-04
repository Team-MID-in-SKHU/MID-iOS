//
//  RefreshTokenResponseDto.swift
//  MID
//
//  Created by 천성우 on 6/4/24.
//

import Foundation

struct RefreshTokenResponseDto: Codable {
    let accessToken: String
    let refreshToken: String
}
