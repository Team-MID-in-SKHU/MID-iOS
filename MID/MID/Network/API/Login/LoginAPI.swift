//
//  LoginAPI.swift
//  MID
//
//  Created by 천성우 on 6/4/24.
//

import UIKit

import Moya

final class LoginAPI {
    static let shared: LoginAPI = LoginAPI()
    
    private let loginProvider = MoyaProvider<LoginTarget>(plugins: [NetworkLoggerPlugin()])
    
    private init() {}
    
    public private(set) var loginData: GeneralResponse<LoginResponseDto>?
    public private(set) var refreshTokenData: GeneralResponse<RefreshTokenResponseDto>?
    
    // MARK: - POST
    /// 카카오 로그인
    func postKakaoLogin(param: LoginRequestDto, completion: @escaping (GeneralResponse<LoginResponseDto>?) -> Void) {
        loginProvider.request(.login(param: param)) {
            result in
            switch result {
            case .success(let response):
                if response.statusCode == 401 {
                    TokenManager.shared.refreshNewToken { success in
                        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                            if success {
                                self.postKakaoLogin(param: param, completion: completion)
                            } else {
                                completion(nil)
                            }
                        }
                    }
                } else {
                    do {
                        self.loginData = try response.map(GeneralResponse<LoginResponseDto>?.self)
                        guard let loginData = self.loginData else { return }
                        completion(loginData)
                    } catch let err {
                        print(err.localizedDescription, 500)
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
    
    // MARK: - GET
    /// 토큰 재발급
    func getRefreshToken(completion: @escaping (GeneralResponse<RefreshTokenResponseDto>?) -> Void) {
        loginProvider.request(.tokenRefresh) {
            result in
            switch result {
            case .success(let response):
                do {
                    let status = response.statusCode
                    if status == 401 {
                        let mainViewController = LoginViewController()
                        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
                        sceneDelegate.window?.rootViewController = UINavigationController(rootViewController: mainViewController)
                        sceneDelegate.window?.makeKeyAndVisible()
                        return
                    } else {
                        self.refreshTokenData = try response.map(GeneralResponse<RefreshTokenResponseDto>?.self)
                        guard let refreshTokenData = self.refreshTokenData else { return }
                        if let accessToken = refreshTokenData.data?.accessToken.data(using: .utf8) {
//                            KeychainHelper.save(key: I18N.Auth.jwtToken, data: accessToken)
                        }
                        if let refreshToken = refreshTokenData.data?.refreshToken.data(using: .utf8) {
//                            KeychainHelper.save(key: I18N.Auth.refreshToken, data: refreshToken)
                            completion(refreshTokenData)
                        }
                    }
                } catch let err {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
    
    // MARK: - DELETE
    /// 회원 탈퇴
    func deleteMemberWithdraw(memberId: Int, completion: @escaping (GeneralResponse<VoidType>?) -> Void) {
        loginProvider.request(.withdraw(memberId: memberId)) {
            result in
            switch result {
            case .success(let response):
                let status = response.statusCode
                do {
                    if status == 401 {
                        let mainViewController = LoginViewController()
                        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
                        sceneDelegate.window?.rootViewController = UINavigationController(rootViewController: mainViewController)
                        sceneDelegate.window?.makeKeyAndVisible()
                        return
                    } else {
                        let data = try response.map(GeneralResponse<VoidType>?.self)
                        completion(data)
                    }
                } catch let err {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
}
