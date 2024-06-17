//
//  ImageTarget.swift
//  MID
//
//  Created by 천성우 on 6/17/24.
//

import Foundation

import Moya
import RxCocoa
import RxMoya
import RxSwift

enum ImageTarget {
    case postImage(param: imageRequestBody)
    case delImage(param: delImageRequestBody)
}

extension ImageTarget: BaseTargetType {
    
    var headers: [String : String]? {
        APIConstants.headerWithAuthorization
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
    
    var path: String {
        switch self {
            
        case .postImage:
            return URLConstant.postImage
        case .delImage:
            return URLConstant.delImage
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postImage:
            return .post
        case .delImage:
            return .delete

        }
    }
    
    var task: Moya.Task {
        switch self {
        case .postImage(let parameter):
            let parameters = try! parameter.asParameter()
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .delImage(let parameter):
            let parameters = try! parameter.asParameter()
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    
    }
}

struct ImageService: Networkable {
    typealias Target = ImageTarget
    private static let provider = makeProvider()
    
    
    /**
     이미지를 업로드합니다.
     - parameter file: imageRequestBody
     */
    
    static func postImage(file: imageRequestBody) -> Observable<imageResponseBody> {
        return provider.rx.request(.postImage(param: file))
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: imageResponseBody.self)
    }
    
    /**
     업로드한 이미지를 삭제합니다
     - parameter file: delImageRequestBody
     */
    
    static func delImage(file: delImageRequestBody) -> Observable<delImageResponseBody> {
        return provider.rx.request(.delImage(param: file))
            .asObservable()
            .mapError()
            .retryOnTokenExpired()
            .decode(decodeType: delImageResponseBody.self)
    }
}
