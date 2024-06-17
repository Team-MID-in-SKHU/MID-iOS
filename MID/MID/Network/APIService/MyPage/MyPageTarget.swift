//
//  MyPageTarget.swift
//  MID
//
//  Created by 천성우 on 6/17/24.
//

import Foundation

import Moya
import RxCocoa
import RxMoya
import RxSwift

enum MyPageTarget {
    case fcm(param: FCMRequestBody)
    case editUserDetails(param: EditUserDetailRequeestBody)
    case getUserDetails
    case putInterest(param: UserInterestUpDateBody)
    case registerInterest(param: UserInterestUpDateBody)
    case usetInfo
}

extension MyPageTarget: BaseTargetType {
    
    var headers: [String : String]? {
        APIConstants.headerWithAuthorization
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
    
    var path: String {
        switch self {
            
        case .fcm:
            return URLConstant.fcm
        case .editUserDetails:
            return URLConstant.editUser
        case .getUserDetails:
            return URLConstant.detailsUser
        case .putInterest:
            return URLConstant.interest
        case .registerInterest:
            return URLConstant.setInterest
        case .usetInfo:
            return URLConstant.usetInfo
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fcm, .registerInterest:
            return .post
        case .editUserDetails:
            return .patch
        case .getUserDetails, .usetInfo:
            return .get
        case .putInterest:
            return .put
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fcm(let parameter):
            let parameters = try! parameter.asParameter()
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .editUserDetails(let parameter):
            let parameters = try! parameter.asParameter()
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)

        case .putInterest(let parameter):
            let parameters = try! parameter.asParameter()
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .registerInterest(let parameter):
            let parameters = try! parameter.asParameter()
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .getUserDetails, .usetInfo:
            return .requestPlain
        }
    
    }
}

struct MyPageService: Networkable {
    typealias Target = MyPageTarget
    private static let provider = makeProvider()
    
    
    /**
     fcm 요청을 합니다.
     - parameter fcm: FCMRequestBody
     */
    
    static func postFCM(fcm: FCMRequestBody) -> Observable<FCMResponseBody> {
        return provider.rx.request(.fcm(param: fcm))
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: FCMResponseBody.self)
    }
    
    /**
     사용자의 정보 수정 요청을 합니다.
     - parameter userData: SignUpRequestBody
     */
    
    static func patchUserDetails(userData: EditUserDetailRequeestBody) -> Observable<UserDetailResponseBody> {
        return provider.rx.request(.editUserDetails(param: userData))
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: UserDetailResponseBody.self)
    }
    
    /**
     사용자의 정보 상세보기를 요청 합니다.
     */
    
    static func getUserDetails() -> Observable<UserDetailResponseBody> {
        return provider.rx.request(.getUserDetails)
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: UserDetailResponseBody.self)
    }
    
    /**
     사용자의 관심사 수정 요청을 합니다.
     - parameter interest: UserInterestUpDateBody
     */
    
    static func patchUserInterest(interest: UserInterestUpDateBody) -> Observable<UserInterestUpDateBody> {
        return provider.rx.request(.putInterest(param: interest))
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: UserInterestUpDateBody.self)
    }
    
    /**
     사용자의 관심사 등록 요청을 합니다.
     - parameter interest: UserInterestUpDateBody
     */
    
    static func postUserInterest(interest: UserInterestUpDateBody) -> Observable<UserInterestUpDateBody> {
        return provider.rx.request(.putInterest(param: interest))
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: UserInterestUpDateBody.self)
    }
    
    /**
     사용자의 정보를 조회 합니다.
     - parameter interest: UserInterestUpDateBody
     */
    
    static func getUserInfo()  -> Observable<UserResponseBody> {
        return provider.rx.request(.usetInfo)
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: UserResponseBody.self)
    }
}
