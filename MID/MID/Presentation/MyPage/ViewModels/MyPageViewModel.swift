//
//  MyPageViewModel.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import RxCocoa
import RxSwift

protocol MyPageViewModelInput {
    func myInformationDidTap()
    func interestModifyDidTap(userData: UserInterestUpDateBody)
    func pushAlarmDidTap()
    func logOutDidTap()
    func withdrawalDidTap()
}

protocol MyPageViewModelOutput {
    var myPageMenuList: BehaviorRelay<[String]> { get }
    var logOutBool: BehaviorRelay<Int> { get }
    var userInfo: BehaviorRelay<UserResponseBody> { get }
    var interestBool: BehaviorRelay<Int> { get }
}

protocol MyPageViewModelType {
    var inputs: MyPageViewModelInput { get }
    var outputs: MyPageViewModelOutput { get }
}

final class MyPageViewModel: MyPageViewModelInput, MyPageViewModelOutput, MyPageViewModelType {
    
    var myPageMenuList: BehaviorRelay<[String]> = BehaviorRelay(value: [])
    var logOutBool: BehaviorRelay<Int> = BehaviorRelay(value: 3)
    var interestBool: BehaviorRelay<Int> = BehaviorRelay(value: 3)
    var userInfo: BehaviorRelay<UserResponseBody> = BehaviorRelay<UserResponseBody>(value: UserResponseBody.userInfoDummy())
    
    private let disposeBag = DisposeBag()

    private let myPageList: [String] = [
        "내 정보 보기", "관심사 수정", "푸쉬알림 설정", "로그아웃"
    ]
    
    var inputs: MyPageViewModelInput { return self }
    var outputs: MyPageViewModelOutput { return self }
    
    init() {
        myPageMenuList.accept(myPageList)
        getUserInfo()
    }
    
    func myInformationDidTap() {
        print("myInformationDidTap")
    }
    
    func interestModifyDidTap(userData: UserInterestUpDateBody) {
        postUserInterest(interest: userData)
    }
    
    func pushAlarmDidTap() {
        print("pushAlarmDidTap")
        if let appSettings = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(appSettings) {
                UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
            }
        }
    }
    
    func logOutDidTap() {
        print("logOutDidTap")
        postLogOut()
    }
    
    func withdrawalDidTap() {
        postSignOut()
    }
}

extension MyPageViewModel {
    func postLogOut() {
        logOutBool.accept(1)
        AuthService.postLogOut()
            .subscribe(onNext: { [weak self] data in
                print("\(data)")
        }, onError: { [weak self] error in
            guard let self else { return }
            logOutBool.accept(0)
        })
        .disposed(by: disposeBag)
    }
    
    func postSignOut() {
        AuthService.deleteUser()
            .subscribe(onNext: { [weak self] data in
                print("\(data) 회원탈퇴 되었습니다.")
        }, onError: { [weak self] error in
            guard let self else { return }
            print(error)
        })
        .disposed(by: disposeBag)
    }
    
    func getUserInfo() {
        MyPageService.getUserInfo()
            .subscribe(onNext: { [weak self] data in
                guard let self else { return }
                self.userInfo.accept(data)
                UserDefaults.standard.set(data.name, forKey: StringLiterals.Auth.userName)
                UserDefaults.standard.set(data.department, forKey: StringLiterals.Auth.userDepartment)
                UserDefaults.standard.set(data.studentNo, forKey: StringLiterals.Auth.userStudentNo)
            }, onError: { [weak self] error in
                guard let self else { return }
                print(error)
            })
            .disposed(by: disposeBag)
    }
    
    func postUserInterest(interest: UserInterestUpDateBody) {
        MyPageService.postUserInterest(interest: interest)
            .subscribe(onNext: { [weak self] data in
                print("사용자의 관심사 설정이 되었습니다")
                print(data)
                self?.interestBool.accept(1)
        }, onError: { [weak self] error in
            guard let self else { return }
            print(error)
            interestBool.accept(0)
        })
        .disposed(by: disposeBag)
    }
}
