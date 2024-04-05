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
}

protocol TodoViewModelOutput {

}

protocol TodoViewModelType {
    var inputs: TodoViewModelInput { get }
    var outputs: TodoViewModelOutput { get }
}

final class TodoViewModel: TodoViewModelInput, TodoViewModelOutput, TodoViewModelType {
    
    var inputs: TodoViewModelInput { return self }
    var outputs: TodoViewModelOutput { return self }
    
    init() {}    
}
