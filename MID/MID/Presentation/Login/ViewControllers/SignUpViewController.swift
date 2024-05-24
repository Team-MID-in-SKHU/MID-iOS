//
//  SignUpViewController.swift
//  MID
//
//  Created by 천성우 on 5/14/24.
//
// 학번, 비밀번호, 이름, 전화번호, 소속학부

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class SignUpViewController: BaseViewController {
    
    
    private let viewModel: LoginViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let signUpFirstPage = SignUpFirstPageView()
    private let signUpSecondPage = SignUpSecondPageView()
    
    // MARK: - Properties
    
    
    // MARK: - Initializer

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .white000
    }
    
    init(viewModel: LoginViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func bindViewModel() {
        signUpFirstPage.nextButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.pushToSecondPage()
            }
            .disposed(by: disposeBag)

    }
    
    override func setStyles() {
        view.backgroundColor = .gray600
    }
    
    override func setLayout() {
        view.addSubviews(signUpFirstPage)
        
        signUpFirstPage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func pushToSecondPage() {
        let vc = SignUpPageSecondViewController(viewModel: self.viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


