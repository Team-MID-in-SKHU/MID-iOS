//
//  SMSTarget.swift
//  MID
//
//  Created by 천성우 on 6/17/24.
//

import Foundation

import Moya
import RxCocoa
import RxMoya
import RxSwift

enum SMSTarget {
    case postSMS(param: CertificationRequestBody)
    case postSMSConfirm(param: ConfirmSMSRequestBody)
}

extension SMSTarget: BaseTargetType {
    
    var headers: [String : String]? {
        APIConstants.headerWithAuthorization
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
    
    var path: String {
        switch self {
        case .postSMS:
            return URLConstant.sendSMS
        case .postSMSConfirm:
            return URLConstant.confirmSMS
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postSMS, .postSMSConfirm:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .postSMS(let parameter):
            let parameters = try! parameter.asParameter()
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .postSMSConfirm(let parameter):
            let parameters = try! parameter.asParameter()
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        

        }
    }
}

struct SMSService: Networkable {
    typealias Target = SMSTarget
    private static let provider = makeProvider()
    
    
    /**
     사용자에게 sms를 통해서 인증번호를 발송합니다
     - parameter param: CertificationRequestBody
     */
    
    static func postSMS(param: CertificationRequestBody) -> Observable<String> {
        return provider.rx.request(.postSMS(param: param))
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: String.self)
    }
    
    /**
     사용자에게 받은 sms번호를 검증합니다.
     - parameter param: ConfirmSMSRequestBody
     */
    
    static func postSMSConfirm(param: ConfirmSMSRequestBody) -> Observable<String> {
        return provider.rx.request(.postSMSConfirm(param: param))
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: String.self)
    }
}
