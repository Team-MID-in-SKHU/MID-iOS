//
//  TodoViewController.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class TodoViewController: BaseViewController {

    private let titleView = LookUpButtonView()
    
    private let viewModel = TodoViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
   
    // MARK: - Properties
    
    override func bindViewModel() {
        titleView.buttonFrame.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.viewModel.inputs.lookUpButtonTap()
            }
            .disposed(by: disposeBag)
    }
    
    override func setStyles() {
        view.backgroundColor = .gray600
    }
    
    override func setLayout() {
        view.addSubviews(titleView)
        
        titleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(SizeLiterals.Screen.screenHeight * 0.01355)
            $0.leading.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 0.888)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 0.117)
        }
    }
}

