//
//  NoticeViewModel.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import RxCocoa
import RxSwift

protocol NoticeViewModelInput {

}

protocol NoticeViewModelOutput {
}

protocol NoticeViewModelType {
    var inputs: NoticeViewModelInput { get }
    var outputs: NoticeViewModelOutput { get }
}

final class NoticeViewModel: NoticeViewModelInput, NoticeViewModelOutput, NoticeViewModelType {
    
    var inputs: NoticeViewModelInput { return self }
    var outputs: NoticeViewModelOutput { return self }
    
    init() {
        
    }
    
}
