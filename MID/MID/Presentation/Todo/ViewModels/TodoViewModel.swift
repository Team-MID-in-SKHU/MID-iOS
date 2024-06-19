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
    var laterTodoList: BehaviorRelay<[String]> { get }
}

protocol TodoViewModelType {
    var inputs: TodoViewModelInput { get }
    var outputs: TodoViewModelOutput { get }
}

final class TodoViewModel: TodoViewModelInput, TodoViewModelOutput, TodoViewModelType {
    
    var todayTodoList: BehaviorRelay<[String]> = BehaviorRelay(value: [])
    var laterTodoList: BehaviorRelay<[String]> = BehaviorRelay(value: [])

    private let disposeBag = DisposeBag()

    
    private let testTodoList: [String] = [
        "소프트웨어캡스톤디자인 최종제출", "2024-1학기 기말고사 기간"
    ]
    
    
    private let testLaterTodoList: [String] = [
        "2024-1학기 종강일 D-2", "2024-여름 계절학기 수업기간 D-5"
    ]
    
    
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

extension TodoViewModel {
    func getTodo() {
        TodoService.getTodo()
            .subscribe(onNext: { [weak self] data in
                guard let self else { return }
                print("오늘의 할 일을 조회합니다.")
            }, onError: { [weak self] error in
                guard let self else { return }
                print(error)
            })
            .disposed(by: disposeBag)
    }
}

