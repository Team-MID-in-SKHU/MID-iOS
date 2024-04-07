//
//  OnboardingViewModel.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import RxCocoa
import RxSwift

protocol OnboardingViewModelInput {
    
}

protocol OnboardingViewModelOutput {

}

protocol OnboardingViewModelType {
    var inputs: OnboardingViewModelInput { get }
    var outputs: OnboardingViewModelOutput { get }
}

final class OnboardingViewModel: OnboardingViewModelInput, OnboardingViewModelOutput, OnboardingViewModelType {
    
    var inputs: OnboardingViewModelInput { return self }
    var outputs: OnboardingViewModelOutput { return self }
    
    init() { }
}
