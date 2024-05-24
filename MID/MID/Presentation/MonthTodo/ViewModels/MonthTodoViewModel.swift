//
//  MonthTodoViewModel.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import RxCocoa
import RxSwift

protocol MonthTodoViewModelInput {
}

protocol MonthTodoViewModelOutput {
    var midList: BehaviorRelay<[String]> { get }

}

protocol MonthTodoViewModelType {
    var inputs: MonthTodoViewModelInput { get }
    var outputs: MonthTodoViewModelOutput { get }
}

final class MonthTodoViewModel: MonthTodoViewModelInput, MonthTodoViewModelOutput, MonthTodoViewModelType {
    
    var midList: BehaviorRelay<[String]> = BehaviorRelay(value: [])
    
    var inputs: MonthTodoViewModelInput { return self }
    var outputs: MonthTodoViewModelOutput { return self }
    
    private let myMidList: [String] = [
        "임시 테스트 1", "임시 테스트 2", "임시 테스트 3"
    ]
    
    init() {
        midList.accept(myMidList)
    }
}
