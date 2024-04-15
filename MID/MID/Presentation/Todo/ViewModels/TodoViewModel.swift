//
//  TodoViewModel.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import RxCocoa
import RxSwift

protocol TodoViewModelInput {
    func lookUpButtonTap()
}

protocol TodoViewModelOutput {
    var todayTodoList: BehaviorRelay<[String]> { get }
    var laterTodoList: BehaviorRelay<[DayTodo]> { get }
}

protocol TodoViewModelType {
    var inputs: TodoViewModelInput { get }
    var outputs: TodoViewModelOutput { get }
}

final class TodoViewModel: TodoViewModelInput, TodoViewModelOutput, TodoViewModelType {
    
    var todayTodoList: BehaviorRelay<[String]> = BehaviorRelay(value: [])
    var laterTodoList: BehaviorRelay<[DayTodo]> = BehaviorRelay(value: [])

    
    private let testTodoList: [String] = [
        "IT&미디어콘텐츠 경진대회 참가 신청", "IT융합자율학부 야식사업"
    ]
    
    var testLaterdata = dummyLaterTodoData()
    
    private let testLaterTodoList: [DayTodo] = testLaterdata
    
    
    var inputs: TodoViewModelInput { return self }
    var outputs: TodoViewModelOutput { return self }
    
    init() {
        todayTodoList.accept(testTodoList)
        laterTodoList.accept(testLaterTodoList)
    }
    
    func lookUpButtonTap() {
        print("lookUpButtonTap")
    }
}
