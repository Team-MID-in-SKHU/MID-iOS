//
//  EventDTO.swift
//  MID
//
//  Created by 천성우 on 6/17/24.
//

import Foundation

struct EventSearchRequestBody: Codable {
    let title, startAt, endAt: String
    let categoryList: [String]
}

struct EventSearchResponseBodyElement: Codable {
    let eventID: Int
    let eventTitle, eventDescription, eventLocation: String
    let imageUrls: [String]
    let startAt, endAt: String
    let category: [String]

    enum CodingKeys: String, CodingKey {
        case eventID = "eventId"
        case eventTitle, eventDescription, eventLocation, imageUrls, startAt, endAt, category
    }
}

typealias EventSearchResponseBody = [EventSearchResponseBodyElement]

struct EventDetailRequeestBody: Codable {
    let id: String
}

struct EventDetailResponseBody: Codable {
    let eventID: Int
    let eventTitle, eventDescription, eventLocation: String
    let imageUrls: [String]
    let startAt, endAt: String
    let category: [String]

    enum CodingKeys: String, CodingKey {
        case eventID = "eventId"
        case eventTitle, eventDescription, eventLocation, imageUrls, startAt, endAt, category
    }
}

