//
//  SignUpView.swift
//  MID
//
//  Created by 천성우 on 5/14/24.
//

import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

final class SignUpFirstPageView: BaseView {
    
    // MARK: - UI Components

    private let topLabel = UILabel()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let idCheckButton = UIButton()
    let idTextField = UnderLineTextField()
    let nextButton = UIButton()
    private let percentBar = UIPercentBar(frame: .zero, percentValue: 8)
  
    // MARK: - UI Components Property
    
    private var isIdValid: Bool {
        guard let idText = idTextField.text else { return false }
        return idText.count == 9 && idText.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }

    
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
            $0.text = "아이디를 입력해주세요"
            $0.font = .fontGuide(.head2)
            $0.textColor = .white000
        }
        
        subTitleLabel.do {
            $0.text = "아이디는 학번입니다 :)"
            $0.textColor = .gray100
            $0.font = .fontGuide(.detail2_bold)
        }
        
//        idCheckButton.do {
//            $0.setTitle("중복 확인", for: .normal)
//            $0.titleLabel?.font = .fontGuide(.detail2_bold)
//            $0.titleLabel?.textColor = .white000
//            $0.backgroundColor = .gray500
//            $0.layer.cornerRadius = 8
//        }

        idTextField.do {
            $0.setPlaceholder(
                placeeholder: "학번을 입력해주세요",
                color: .gray100
            )
            $0.font = .fontGuide(.head1)
            $0.textColor = .white000
            $0.addTarget(self, action: #selector(idTextFieldDidChange(_:)), for: .editingChanged)

        }
        
        nextButton.do {
            $0.setTitle("다음", for: .normal)
            $0.setTitleColor(.white000, for: .normal)
            $0.backgroundColor = .gray500
            $0.layer.cornerRadius = 8
            $0.isEnabled = false
        }
    }
    
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(topLabel, titleLabel, subTitleLabel,
                    idCheckButton, idTextField, nextButton,
                    percentBar)
        
        
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
        
//        idCheckButton.snp.makeConstraints {
//            $0.top.equalTo(titleLabel.snp.top).offset(SizeLiterals.Screen.screenHeight * 10 / 812)
//            $0.trailing.equalToSuperview().offset(-SizeLiterals.Screen.screenWidth * 17 / 375)
//        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 30 / 812)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 340 / 375)
        }
        
        percentBar.snp.makeConstraints {
            $0.bottom.equalTo(nextButton.snp.top).offset(-SizeLiterals.Screen.screenHeight * 20 / 812)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 353 / 375)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-SizeLiterals.Screen.screenHeight * 48 / 812)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 353 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
        }
    }
    
    // MARK: - Methods
    


    // MARK: - @objc Methods
    
    @objc 
    private func idTextFieldDidChange(_ textField: UITextField) {
        nextButton.isEnabled = isIdValid
        
        if isIdValid {
            nextButton.backgroundColor = .white000
            nextButton.setTitleColor(.gray500, for: .normal)
        } else {
            nextButton.backgroundColor = .gray500
            nextButton.setTitleColor(.white000, for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
