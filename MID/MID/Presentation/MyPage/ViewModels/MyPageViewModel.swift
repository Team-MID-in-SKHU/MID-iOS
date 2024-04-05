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

}

protocol MyPageViewModelType {
    var inputs: MyPageViewModelInput { get }
    var outputs: MyPageViewModelOutput { get }
}

final class MyPageViewModel: MyPageViewModelInput, MyPageViewModelOutput, MyPageViewModelType {
    
    var inputs: MyPageViewModelInput { return self }
    var outputs: MyPageViewModelOutput { return self }
    
    init() {}
}
