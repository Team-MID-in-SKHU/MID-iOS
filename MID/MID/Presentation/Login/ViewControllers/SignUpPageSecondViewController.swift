//
//  SignUpPageSecondViewController.swift
//  MID
//
//  Created by 천성우 on 5/15/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class SignUpPageSecondViewController: BaseViewController {
    
    
    private let viewModel = TodoViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let signUpSecondPage = SignUpSecondPageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Properties
    
    
    override func bindViewModel() {
        signUpSecondPage.nextButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.pushThirdPage()
            }
            .disposed(by: disposeBag)

    }
    
    override func setStyles() {
        view.backgroundColor = .gray600
    }
    
    override func setLayout() {
        view.addSubviews(signUpSecondPage)
        
        signUpSecondPage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func pushThirdPage() {
        view.addSubviews(signUpSecondPage)
        
        signUpSecondPage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}


