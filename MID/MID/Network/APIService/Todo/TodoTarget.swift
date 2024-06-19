//
//  TodoTarget.swift
//  MID
//
//  Created by 천성우 on 6/17/24.
//

import Foundation

import Moya
import RxCocoa
import RxMoya
import RxSwift

enum TodoTarget {
    case getTodo
    case getMonthTodo(param: MonthTodayRequestBody)
}

extension TodoTarget: BaseTargetType {
    
    var headers: [String : String]? {
        APIConstants.headerWithAuthorization
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
    
    var path: String {
        switch self {
        case .getTodo:
            return URLConstant.todayTodo
        case .getMonthTodo:
            return URLConstant.monthTodo
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTodo, .getMonthTodo:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getTodo:
            return .requestPlain
            
        case .getMonthTodo(let parameter):
            let parameters = try! parameter.asParameter()
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        

        }
    }
}

struct TodoService: Networkable {
    typealias Target = TodoTarget
    private static let provider = makeProvider()
    
    
    /**
     오늘의 할 일을 조회합니다
     */
    
    static func getTodo() -> Observable<TodayResponses> {
        return provider.rx.request(.getTodo)
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: TodayResponses.self)
    }
    
    /**
     이 달의 할 일을 조회합니다..
     - parameter param: MonthTodayRequestBody
     */
    
    static func getMonthTodo(param: MonthTodayRequestBody) -> Observable<TodayResponses> {
        return provider.rx.request(.getMonthTodo(param: param))
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: TodayResponses.self)
    }
}
