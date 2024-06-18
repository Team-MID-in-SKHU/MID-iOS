//
//  AuthAlertViewController.swift
//  MID
//
//  Created by 천성우 on 6/19/24.
//

import UIKit

import Moya
import RxCocoa
import RxSwift
import SnapKit
import Then

enum authAlertType {
    case failLogin
    case failSignUp
    case failDuplicate
}

final class AuthAlertViewController: BaseViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel: LoginViewModel
    
    // MARK: - UI Components


    private let failLoginAlertView = UIAlertView(frame: .zero, title: "로그인 실패", subTitle: "아이디 혹은 비밀번호를 다시 입력해주세요.", alertType: .failLogin)
    private let failSignUpAlertView = UIAlertView(frame: .zero, title: "회원가입 실패", subTitle: "잘못된 접근입니다.", alertType: .failLogin)
    private let failDuplicateAlertView = UIAlertView(frame: .zero, title: "학번 중복", subTitle: "이미 가입되어있는 학번입니다.", alertType: .failLogin)
    

    
    // MARK: - Properties
    
    private let alertType: authAlertType
    
    // MARK: - Initializer
    
    init(alertType: authAlertType, viewModel: LoginViewModel){
        self.alertType = alertType
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindViewModel() {
        
        failSignUpAlertView.checkButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.didTapCheckButton()
            }
            .disposed(by: disposeBag)

        
        failLoginAlertView.cancelButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.didTapCheckButton()
            }
            .disposed(by: disposeBag)
        
        failSignUpAlertView.cancelButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.didTapCheckButton()
            }
            .disposed(by: disposeBag)
        
        failLoginAlertView.checkButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.didTapCheckButton()
            }
            .disposed(by: disposeBag)
        
        failDuplicateAlertView.checkButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.didTapCheckButton()
            }
            .disposed(by: disposeBag)
        
        failDuplicateAlertView.cancelButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.didTapCheckButton()
            }
            .disposed(by: disposeBag)
 
    }
    
    // MARK: - UI Components Property
    
    override func setStyles() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        switch alertType {
        case .failLogin:
            view.addSubviews(failLoginAlertView)
            
            failLoginAlertView.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 300 / 375)
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 160 / 812)
            }
        case .failSignUp:
            view.addSubviews(failSignUpAlertView)
            
            failLoginAlertView.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 300 / 375)
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 160 / 812)
            }
        case .failDuplicate:
            view.addSubviews(failDuplicateAlertView)
            
            failDuplicateAlertView.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 300 / 375)
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 160 / 812)
            }
        }
        
    }
    
    // MARK: - Methods
    
    
    
    // MARK: - @objc Methods
    
    @objc
    private func didTapCheckButton() {
        dismiss(animated: false, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
