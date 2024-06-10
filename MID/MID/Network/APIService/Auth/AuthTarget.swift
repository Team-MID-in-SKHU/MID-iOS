//
//  LoginTarget.swift
//  MID
//
//  Created by 천성우 on 6/4/24.
//

import Foundation

import Moya
import RxCocoa
import RxMoya
import RxSwift

enum AuthTarget {
    case signUp(param: SignUpRequestBody)
    case login(param: LoginRequestBody)
    case tokenRefresh
    case withdraw(memberId: Int)
}

extension AuthTarget: BaseTargetType {
    
    var headers: [String : String]? {
        APIConstants.headerWithAuthorization
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
    
    var path: String {
        switch self {
        case .signUp:
            return URLConstant.signUp
        case .login:
            return URLConstant.login
        case .tokenRefresh:
            return URLConstant.tokenRefresh
        case .withdraw(memberId: let memberId):
            let path = URLConstant.memberWithdraw.replacingOccurrences(of: "{memberId}", with: String(memberId))
            return path
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUp, .login:
            return .post
        case .tokenRefresh:
            return .get
        case .withdraw:
            return .delete
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signUp(let parameter):
            let parameters = try! parameter.asParameter()
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case .login(let parameter):
            let parameters = try! parameter.asParameter()
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case .tokenRefresh:
            return .requestPlain
        case .withdraw:
            return .requestPlain
        }
    }
}

struct AuthService: Networkable {
    typealias Target = AuthTarget
    private static let provider = makeProvider()
    
    
    /**
     회원가입을 합니다.
     - parameter userData: SignUpRequestBody
     */
    
    static func postSignUp(userData: SignUpRequestBody) -> Observable<SignUpResponseBody> {
        return provider.rx.request(.signUp(param: userData))
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: SignUpResponseBody.self)
    }
    
    /**
     로그인을 합니다.
     - parameter userData: SignUpRequestBody
     */
    
    static func postLogin(userData: LoginRequestBody) -> Observable<LoginResponseBody> {
        return provider.rx.request(.login(param: userData))
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: LoginResponseBody.self)
    }
    

    
}

