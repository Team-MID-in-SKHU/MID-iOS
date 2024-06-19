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
    
    
    private let viewModel: LoginViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
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
        signUpSecondPage.nextButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                let userPw = self.signUpSecondPage.pwTextField.text ?? ""
                self.viewModel.inputs.didTapSignUpSecondPage(password: userPw)
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
        let vc = SignUpPageThirdViewController(viewModel: self.viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


