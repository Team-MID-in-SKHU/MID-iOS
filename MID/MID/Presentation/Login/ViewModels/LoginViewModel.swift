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
    func didTapSignUpFirstPage(studentNo: String)
    func didTapSignUpSecondPage(password: String)
    func didTapSignUpThirdPage(name: String, department: String, phoneNumber: String, fcmToken: String, roleType: String)
}

protocol LoginViewModelOutput {
    var loginBool: BehaviorRelay<Int> { get }
    var signUpBool: BehaviorRelay<Int> { get }
    var duplicateBool: BehaviorRelay<Int> { get }
}

protocol LoginViewModelType {
    var inputs: LoginViewModelInput { get }
    var outputs: LoginViewModelOutput { get }
}

final class LoginViewModel: LoginViewModelInput, LoginViewModelOutput, LoginViewModelType {
    
    private let disposeBag = DisposeBag()
    
    var loginUserData: LoginRequestBody = LoginRequestBody(studentNo: "", password: "", fcmToken: "1234")
    var signUpUserData: SignUpRequestBody = SignUpRequestBody(studentNo: "", password: "", name: "", department: "", phoneNumber: "", fcmToken: "", roleType: "")
    var duplicate: DuplicateRequestBody = DuplicateRequestBody(studentNo: "")
    var loginBool: BehaviorRelay<Int> = BehaviorRelay(value: 3)
    var signUpBool: BehaviorRelay<Int> = BehaviorRelay(value: 3)
    var duplicateBool: BehaviorRelay<Int> = BehaviorRelay(value: 3)
    
    var inputs: LoginViewModelInput { return self }
    var outputs: LoginViewModelOutput { return self }
    
    init() {}
    
    func didTapLoginButton(id: String, pw: String) {
        self.loginUserData.studentNo = id
        self.loginUserData.password = pw
        postLogin(userData: loginUserData)
    }
    
    func didTapSignUpFirstPage(studentNo: String) {
        self.signUpUserData.studentNo = studentNo
        self.duplicate.studentNo = studentNo
        postDuplicateCheck(studentNo: duplicate)
    }
    
    func didTapSignUpSecondPage(password: String) {
        self.signUpUserData.password = password
    }
    
    func didTapSignUpThirdPage(name: String, department: String, phoneNumber: String, fcmToken: String, roleType: String) {
        self.signUpUserData.name = name
        self.signUpUserData.department = department
        self.signUpUserData.phoneNumber = phoneNumber
        self.signUpUserData.fcmToken = fcmToken
        self.signUpUserData.roleType = roleType
        
        postSignUp(userData: signUpUserData)
    }
}

extension LoginViewModel {
    func postLogin(userData: LoginRequestBody) {
        AuthService.postLogin(userData: userData)
            .subscribe(onNext: { [weak self] data in
                guard let self else { return }
                print("로그인에 성공했습니다")
                APIConstants.jwtToken = data.accessToken
                APIConstants.refreshToken = data.refreshToken
                UserDefaults.standard.set(data.accessToken, forKey: StringLiterals.Auth.jwtToken)
                UserDefaults.standard.set(data.refreshToken, forKey: StringLiterals.Auth.refreshToken)
                loginBool.accept(1)
            }, onError: { [weak self] error in
                guard let self else { return }
                print("로그인에 실패하였습니다")
                loginBool.accept(0)
            })
            .disposed(by: disposeBag)
    }
    
    func postDuplicateCheck(studentNo: DuplicateRequestBody) {
        print("이거 들어가짐")
        AuthService.postDuplicateCheck(studentNo: studentNo)
            .subscribe(onNext: { [weak self] data in
                guard let self else { return }
                if !data.studentNo {
                    duplicateBool.accept(1)
                } else {
                    duplicateBool.accept(0)
                }
                duplicateBool.accept(3)
            }, onError: { [weak self] error in
                guard let self else { return }
                print("유효하지 않거나 중복된 학번 입력입니다.")
                duplicateBool.accept(0)
            })
            .disposed(by: disposeBag)
    }
    
    func postSignUp(userData: SignUpRequestBody){
        AuthService.postSignUp(userData: userData)
            .subscribe(onNext: { [weak self] data in
                guard let self else { return }
                print("회원가입에 성공하였습니다")
                signUpBool.accept(1)
            }, onError: { [weak self] error in
                guard let self else { return }
                print("회원가입에 실패하였습니다")
                signUpBool.accept(0)
            })
            .disposed(by: disposeBag)
    }
}
