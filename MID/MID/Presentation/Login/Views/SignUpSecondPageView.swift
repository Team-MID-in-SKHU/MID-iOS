//
//  SignUpSecondPageView.swift
//  MID
//
//  Created by 천성우 on 5/14/24.
//

import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

final class SignUpSecondPageView: BaseView {
    
    // MARK: - UI Components

    private let topLabel = UILabel()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    let pwTextField = UnderLineTextField()
    let pwCheckButton = UIButton()
    private let percentBar = UIPercentBar(frame: .zero, percentValue: 2)
    
    // MARK: - UI Components Property

    
    // MARK: - Initializer
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func setStyles() {
        backgroundColor = .gray600
        
        topLabel.do {
            $0.text = "MID 회원가입"
            $0.font = .fontGuide(.head2)
            $0.textColor = .white000
        }
        
        titleLabel.do {
            $0.text = "비밀번호를 입력해주세요"
            $0.font = .fontGuide(.head2)
            $0.textColor = .white000
        }
        
        subTitleLabel.do {
            $0.text = "1번만 입력하니 정확히 입력해주세요!"
            $0.textColor = .gray100
            $0.font = .fontGuide(.detail2_bold)
        }

        pwTextField.do {
            $0.setPlaceholder(
                placeeholder: "비밀번호를 입력해주세요",
                color: .gray100
            )
            $0.font = .fontGuide(.head1)
            $0.textColor = .white000
        }
        
        pwCheckButton.do {
            $0.setTitle("다음", for: .normal)
            $0.setTitleColor(.white000, for: .normal)
            $0.backgroundColor = .gray500
        }
    }
    
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(topLabel, titleLabel, subTitleLabel,
                    pwTextField, percentBar, pwCheckButton)
        
        
        topLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 30 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 17 / 375)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(topLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 60 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 17 / 375)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 17 / 375)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 30 / 812)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 340 / 375)
        }
        
        percentBar.snp.makeConstraints {
            $0.bottom.equalTo(pwCheckButton.snp.top).offset(-SizeLiterals.Screen.screenHeight * 20 / 812)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 353 / 375)
        }
        
        pwCheckButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-SizeLiterals.Screen.screenHeight * 48 / 812)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 353 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
        }
    }
    
    // MARK: - Methods
    


    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
