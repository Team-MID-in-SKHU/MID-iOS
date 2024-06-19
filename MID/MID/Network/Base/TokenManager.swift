//
//  TokenManager.swift
//  MID
//
//  Created by 천성우 on 6/4/24.
//

import UIKit
import Security

import Moya
import RxSwift
import RxMoya

final class TokenManager {
    
    static let shared = TokenManager()
    private let authProvider = MoyaProvider<AuthTarget>(plugins: [NetworkLoggerPlugin()])
    
    private init() {}
    
    func refreshNewToken() -> Observable<Void> {
        return authProvider.rx.request(.tokenRefresh)
            .asObservable()
            .do(onNext: { response in
                if response.statusCode == 401 {
                    let mainViewController = LoginViewController()
                    guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
                    sceneDelegate.window?.rootViewController = UINavigationController(rootViewController: mainViewController)
                    sceneDelegate.window?.makeKeyAndVisible()
                }
            })
            .decode(decodeType: RefreshTokenResponseDto.self)
            .do(onNext: { data in
                print("🔥")
                print("New Token is now valid.")
                APIConstants.jwtToken = data.accessToken
                APIConstants.refreshToken = data.refreshToken
                if let accessTokenData = data.accessToken.data(using: .utf8) {
                    KeychainHelper.save(key: StringLiterals.Auth.jwtToken, data: accessTokenData)
                }

                if let refreshTokenData = data.refreshToken.data(using: .utf8) {
                    KeychainHelper.save(key: StringLiterals.Auth.refreshToken, data: refreshTokenData)
                }
            })
            .map {_ in}
    }
}
