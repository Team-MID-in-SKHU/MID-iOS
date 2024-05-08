//
//  LoginView.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

final class LoginView: BaseView {
    
    // MARK: - UI Components

    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let idLabel = UILabel()
    private let idField = UITextField()
    private let pwLabel = UILabel()
    private let pwField = UITextField()
    let signUpButton = UIButton()
    let signInButton = UIButton()
    private let forgetPwLabel = UILabel()
    private let forgetPwButton = UIButton()
    
    // MARK: - UI Components Property

    
    // MARK: - Initializer
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func setStyles() {
        backgroundColor = .gray600
        
        titleLabel.do {
            $0.text = "MID 로그인"
            $0.font = .fontGuide(.head2)
            $0.textColor = .white000
        }
        
        subTitleLabel.do {
            $0.text = "ID는 학번입니다"
            $0.font = .fontGuide(.body3_bold)
            $0.textColor = .gray200
        }
        
        idLabel.do {
            $0.text = "아이디"
            $0.font = .fontGuide(.detail1_reg)
            $0.textColor = .white000
        }
        
        idField.do {
            $0.placeholder = "학번을 입력해주세요"
            $0.setLeftPadding(amount: 12)
            $0.font = .fontGuide(.detail1_reg)
            $0.textColor = .white000
            $0.setPlaceholderColor(.gray100)
        }
        
        pwLabel.do {
            $0.text = "비밀번호"
            $0.font = .fontGuide(.detail1_bold)
            $0.textColor = .white000
        }
        
        pwField.do {
            $0.placeholder = "비밀번호를 입력해주세요"
            $0.setLeftPadding(amount: 12)
            $0.font = .fontGuide(.detail1_reg)
            $0.textColor = .white000
            $0.setPlaceholderColor(.gray100)
        }
        
        signUpButton.do {
            $0.setTitle("회원가입", for: .normal)
            $0.setTitleColor(.black000, for: .normal)
            $0.titleLabel?.font = .fontGuide(.body1_reg)
            $0.backgroundColor = .white000
            $0.layer.cornerRadius = 8
        }
        
        signInButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.setTitleColor(.white000, for: .normal)
            $0.titleLabel?.font = .fontGuide(.body1_reg)
            $0.backgroundColor = .gray500
            $0.layer.cornerRadius = 8
        }
        
        forgetPwLabel.do {
            $0.text = "비밀번호를 잊으셨나요?"
            $0.textColor = .white000
            $0.font = .fontGuide(.body1_bold)
        }
        
        forgetPwButton.do {
            $0.setTitle("도움 받기 >", for: .normal)
            $0.setTitleColor(.white000, for: .normal)
            $0.titleLabel?.font = .fontGuide(.body1_bold)
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.white000.cgColor
            $0.layer.cornerRadius = 4
        }
        
    }
    
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(titleLabel, subTitleLabel, idLabel,
                    idField, pwLabel, pwField,
                    signUpButton, signInButton, forgetPwLabel, forgetPwButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 30 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 17 / 375)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 17 / 375)
        }
        
        idLabel.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 60 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 17 / 375)
        }
        
        idField.snp.makeConstraints {
            $0.top.equalTo(idLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 8 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 17 / 375)
        }
        
        pwLabel.snp.makeConstraints {
            $0.top.equalTo(idField.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 30 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 17 / 375)
        }
        
        pwField.snp.makeConstraints {
            $0.top.equalTo(pwLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 8 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 17 / 375)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(pwField.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 60 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 17 / 375)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 164 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 42 / 812)
        }
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(pwField.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 60 / 812)
            $0.trailing.equalToSuperview().offset(-SizeLiterals.Screen.screenWidth * 17 / 375)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 164 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 42 / 812)
        }
        
        
        forgetPwLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 36 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 17 / 375)
        }
        
        forgetPwButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 36 / 812)
            $0.trailing.equalToSuperview().offset(-SizeLiterals.Screen.screenWidth * 17 / 375)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 77 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 22 / 812)
        }
        
    }
    
    // MARK: - Methods

    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
