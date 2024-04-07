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
}

protocol LoginViewModelOutput {
    
}

protocol LoginViewModelType {
    var inputs: LoginViewModelInput { get }
    var outputs: LoginViewModelOutput { get }
}

final class LoginViewModel: LoginViewModelInput, LoginViewModelOutput, LoginViewModelType {
    
    var inputs: LoginViewModelInput { return self }
    var outputs: LoginViewModelOutput { return self }
    
    init() {}
}
