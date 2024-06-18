//
//  LoginViewModel.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import RxCocoa
import RxSwift

protocol LoginViewModelInput {
    func didTapLoginButton(id: String, pw: String)
}

protocol LoginViewModelOutput {
    var loginBool: BehaviorRelay<Int> { get }
}

protocol LoginViewModelType {
    var inputs: LoginViewModelInput { get }
    var outputs: LoginViewModelOutput { get }
}

final class LoginViewModel: LoginViewModelInput, LoginViewModelOutput, LoginViewModelType {
    
    private let disposeBag = DisposeBag()
    
    var loginUserData: LoginRequestBody = LoginRequestBody(studentNo: "", password: "", fcmToken: "1234")
    var loginBool: BehaviorRelay<Int> = BehaviorRelay(value: 3)
    
    var inputs: LoginViewModelInput { return self }
    var outputs: LoginViewModelOutput { return self }
    
    init() {}
    
    func didTapLoginButton(id: String, pw: String) {
        self.loginUserData.studentNo = id
        self.loginUserData.password = pw
        postLogin(userData: loginUserData)
    }
}

extension LoginViewModel {
    func postLogin(userData: LoginRequestBody){
        AuthService.postLogin(userData: userData)
            .subscribe(onNext: { [weak self] data in
                guard let self else { return }
                print("로그인에 성공했습니다")
                loginBool.accept(1)
            }, onError: { [weak self] error in
                guard let self else { return }
                print("로그인에 실패하였습니다")
                loginBool.accept(0)
            })
            .disposed(by: disposeBag)
    }
}
