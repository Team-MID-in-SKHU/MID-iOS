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
    func didTapDay(day: String)
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
    private let disposeBag = DisposeBag()

    var inputs: MonthTodoViewModelInput { return self }
    var outputs: MonthTodoViewModelOutput { return self }
    
    private let myMidList: [String] = [
        "소프트웨어캡스톤디자인 최종제출", "2024-1학기 기말고사 기간"
    ]
    
    init() {
        midList.accept(myMidList)
    }
    
    func didTapDay(day: String) {
        let day = Int(day) ?? 0
        if day >= 15 && day <= 17 {
            midList.accept(["2024-1학기가 기말고사 기간"])
        } else if day == 19 {
            midList.accept(myMidList)
        } else if day == 18 || day == 20 {
            midList.accept(["2024-1학기가 기말고사 기간"])
        } else if day == 21 {
            midList.accept(["2024-1학기가 기말고사 기간", "2024-1학기 종강일"])
        } else if day >= 24 && day <= 30 {
            midList.accept(["2024-여름 계절학기 수업기간"])
        } else {
            midList.accept([])
        }
    }
}


extension MonthTodoViewModel {
    func getMonthTodo(param: MonthTodayRequestBody) {
        TodoService.getMonthTodo(param: param)
            .subscribe(onNext: { [weak self] data in
                guard let self else { return }
                print("이달의 할 일을 조회합니다.")
            }, onError: { [weak self] error in
                guard let self else { return }
                print(error)
            })
            .disposed(by: disposeBag)
    }
}
