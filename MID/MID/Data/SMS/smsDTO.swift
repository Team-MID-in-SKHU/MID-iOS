//
//  smsDTO.swift
//  MID
//
//  Created by 천성우 on 6/17/24.
//

import Foundation

struct CertificationRequestBody: Codable {
    let phone, certificationNumber: String
}

struct ConfirmSMSRequestBody: Codable {
    let phone, certificationNumber: String
}
