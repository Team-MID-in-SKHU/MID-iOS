//
//  EventTarget.swift
//  MID
//
//  Created by 천성우 on 6/17/24.
//

import Foundation

import Moya
import RxCocoa
import RxMoya
import RxSwift

enum EventTarget {
    case searchEvent(param: EventSearchRequestBody)
    case eventDetail(id: String)
}

extension EventTarget: BaseTargetType {
    
    var headers: [String : String]? {
        APIConstants.headerWithAuthorization
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
    
    var path: String {
        switch self {
            
        case .searchEvent:
            return URLConstant.search
        case .eventDetail(let id):
            let newPath = URLConstant.eventDetail
                .replacingOccurrences(of: "{id}", with: String(id))
            return newPath
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchEvent:
            return .post
        case .eventDetail:
            return .get

        }
    }
    
    var task: Moya.Task {
        switch self {
        case .searchEvent(let parameter):
            let parameters = try! parameter.asParameter()
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .eventDetail(let parameter):
            let parameters = try! parameter.asParameter()
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    
    }
}

struct EventService: Networkable {
    typealias Target = EventTarget
    private static let provider = makeProvider()
    
    
    /**
     행사 & 이벤트를 검색합니다
     - parameter file: imageRequestBody
     */
    
    static func getSearchEvent(title: EventSearchRequestBody) -> Observable<EventSearchResponseBody> {
        return provider.rx.request(.searchEvent(param: title))
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: EventSearchResponseBody.self)
    }
    
    /**
     행사 % 이미지 상세보기를 요청합니다
     - parameter id: String
     */
    
    static func delImage(id: String) -> Observable<EventDetailResponseBody> {
        return provider.rx.request(.eventDetail(id: id))
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: EventDetailResponseBody.self)
    }
}
