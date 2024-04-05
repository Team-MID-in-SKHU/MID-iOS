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

}

protocol MonthTodoViewModelType {
    var inputs: MonthTodoViewModelInput { get }
    var outputs: MonthTodoViewModelOutput { get }
}

final class MonthTodoViewModel: MonthTodoViewModelInput, MonthTodoViewModelOutput, MonthTodoViewModelType {
    
    var inputs: MonthTodoViewModelInput { return self }
    var outputs: MonthTodoViewModelOutput { return self }
    
    init() {}
}
