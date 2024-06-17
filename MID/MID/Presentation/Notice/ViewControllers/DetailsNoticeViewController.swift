//
//  DetailsNoticeViewController.swift
//  MID
//
//  Created by 천성우 on 5/31/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class DetailsNoticeViewController: BaseViewController {
    
    
    private let viewModel = NoticeViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: - Properties
    
    override func bindViewModel() {}
    
    override func setStyles() {
        view.backgroundColor = .gray600
    }
    
    override func setLayout() {}
    
    override func setRegister() {}
    

}
