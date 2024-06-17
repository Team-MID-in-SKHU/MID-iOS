//
//  TodoDTO.swift
//  MID
//
//  Created by 천성우 on 6/17/24.
//

import Foundation

struct TodayResponses: Codable {
    let responseDto: [ResponseDto]
}

struct ResponseDto: Codable {
    let eventID: Int
    let eventTitle, eventDescription, eventLocation, startAt: String
    let endAt: String

    enum CodingKeys: String, CodingKey {
        case eventID = "eventId"
        case eventTitle, eventDescription, eventLocation, startAt, endAt
    }
}


struct MonthTodayRequestBody: Codable {
    let year, month: Int
}
