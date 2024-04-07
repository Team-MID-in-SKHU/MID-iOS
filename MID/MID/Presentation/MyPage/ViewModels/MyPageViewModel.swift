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
}

protocol MyPageViewModelOutput {
    var myPageMenuList: BehaviorRelay<[String]> { get }
}

protocol MyPageViewModelType {
    var inputs: MyPageViewModelInput { get }
    var outputs: MyPageViewModelOutput { get }
}

final class MyPageViewModel: MyPageViewModelInput, MyPageViewModelOutput, MyPageViewModelType {
    
    var myPageMenuList: BehaviorRelay<[String]> = BehaviorRelay(value: [])
    
    private let myPageList: [String] = [
        "내 정보 보기", "관심사 수정", "푸쉬알림 설정", "로그아웃"
    ]
    
    var inputs: MyPageViewModelInput { return self }
    var outputs: MyPageViewModelOutput { return self }
    
    init() {
        myPageMenuList.accept(myPageList)
    }
}
