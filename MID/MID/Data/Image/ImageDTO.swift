//
//  ImageDTO.swift
//  MID
//
//  Created by 천성우 on 6/17/24.
//

import Foundation

struct imageRequestBody: Codable {
    let file: String
}

struct imageResponseBody: Codable {
    let file: String
}

struct delImageRequestBody: Codable {
    let file: String
}

struct delImageResponseBody: Codable {
    let file: String
}
