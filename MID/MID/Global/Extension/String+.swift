//
//  String+.swift
//  MID
//
//  Created by 천성우 on 4/2/24.
//

import Foundation

extension String {
    static func koreanFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "M월 d일 EEEE"
        return dateFormatter.string(from: Date())
    }
}
