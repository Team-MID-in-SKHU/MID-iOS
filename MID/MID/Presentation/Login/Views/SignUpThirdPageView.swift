//
//  SignUpThirdPageView.swift
//  MID
//
//  Created by 천성우 on 5/15/24.
//

import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

final class SignUpThirdPageView: BaseView {
    
    // MARK: - UI Components

    private let topLabel = UILabel()
    private let titleLabel = UILabel()
    
    private let nameLabel = UILabel()
    private let nameTextField = UnderLineTextField()
    private let phoneNumberLabel = UILabel()
    private let phoneNumberTextField = UnderLineTextField()
    private let studentRoleLabel = UILabel()
    private let studentRoleTextField = UnderLineTextField()
    private let studentDepartmentLabel = UILabel()
    private let dePartmentSubTitleLabel = UILabel()
    private let studentDepartmentTextField = UnderLineTextField()
    
    let pwTextField = UnderLineTextField()
    private let checkLabel = UILabel()
    let pwCheckTextField = UnderLineTextField()
    let nextButton = UIButton()
    private let percentBar = UIPercentBar(frame: .zero, percentValue: 1)
    
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
        
        nameLabel.do {
            $0.text = "이름 입력해주세요"
            $0.font = .fontGuide(.head4)
            $0.textColor = .white000
        }
        
        nameTextField.do {
            $0.setPlaceholder(
                placeeholder: "이름을 입력해주세요",
                color: .gray100
            )
            $0.font = .fontGuide(.head1)
            $0.textColor = .white000
            $0.addTarget(self, action: #selector(textFieldsDidChange(_:)), for: .editingChanged)
        }
        
        phoneNumberLabel.do {
            $0.text = "전화번호를 입력해주세요"
            $0.font = .fontGuide(.head4)
            $0.textColor = .white000
        }
        
        phoneNumberTextField.do {
            $0.setPlaceholder(
                placeeholder: "전화번호를 입력해주세요",
                color: .gray100
            )
            $0.font = .fontGuide(.head1)
            $0.textColor = .white000
            $0.keyboardType = .phonePad
            $0.addTarget(self, action: #selector(textFieldsDidChange(_:)), for: .editingChanged)
        }
        
        studentRoleLabel.do {
            $0.text = "??을/를 입력해주세요"
            $0.font = .fontGuide(.head4)
            $0.textColor = .white000
        }
        
        studentRoleTextField.do {
            $0.setPlaceholder(
                placeeholder: "??을/를 입력해주세요",
                color: .gray100
            )
            $0.font = .fontGuide(.head1)
            $0.textColor = .white000
            $0.addTarget(self, action: #selector(textFieldsDidChange(_:)), for: .editingChanged)
        }
        
        studentDepartmentLabel.do {
            $0.text = "학부(학과)를 입력해주세요"
            $0.font = .fontGuide(.head4)
            $0.textColor = .white000
        }
        
        studentDepartmentTextField.do {
            $0.setPlaceholder(
                placeeholder: "학부(학과)를 입력해주세요",
                color: .gray100
            )
            $0.font = .fontGuide(.head1)
            $0.textColor = .white000
            $0.addTarget(self, action: #selector(textFieldsDidChange(_:)), for: .editingChanged)
        }
        
        dePartmentSubTitleLabel.do {
            $0.text = "정확한 학부(학과)명을 입력해주세요"
            $0.textColor = .gray100
            $0.font = .fontGuide(.detail2_bold)
        }

        
        nextButton.do {
            $0.setTitle("회원가입", for: .normal)
            $0.setTitleColor(.white000, for: .normal)
            $0.backgroundColor = .gray500
            $0.isEnabled = false
        }
    }
    
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(topLabel, nameLabel, nameTextField,
                    phoneNumberLabel, phoneNumberTextField, studentRoleLabel,
                    studentRoleTextField, studentDepartmentLabel, dePartmentSubTitleLabel,
                    studentDepartmentTextField, percentBar, nextButton)
        
        
        topLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 30 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 17 / 375)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(topLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 30 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 17 / 375)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 15 / 812)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 340 / 375)
        }
        
        phoneNumberLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 30 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 17 / 375)
        }
        
        phoneNumberTextField.snp.makeConstraints {
            $0.top.equalTo(phoneNumberLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 15 / 812)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 340 / 375)
        }
        
        studentRoleLabel.snp.makeConstraints {
            $0.top.equalTo(phoneNumberTextField.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 30 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 17 / 375)
        }
        
        studentRoleTextField.snp.makeConstraints {
            $0.top.equalTo(studentRoleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 15 / 812)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 340 / 375)
        }
        
        studentDepartmentLabel.snp.makeConstraints {
            $0.top.equalTo(studentRoleTextField.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 30 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 17 / 375)
        }
        
        dePartmentSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(studentDepartmentLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 17 / 375)
        }
        
        studentDepartmentTextField.snp.makeConstraints {
            $0.top.equalTo(dePartmentSubTitleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 20 / 812)
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
    
    @objc private func textFieldsDidChange(_ textField: UITextField) {
        let isAllFieldsFilled = !nameTextField.text!.isEmpty &&
                                !phoneNumberTextField.text!.isEmpty &&
                                !studentRoleTextField.text!.isEmpty &&
                                !studentDepartmentTextField.text!.isEmpty
        
        if isAllFieldsFilled {
            nextButton.backgroundColor = .white000
            nextButton.setTitleColor(.gray500, for: .normal)
            nextButton.isEnabled = true
        } else {
            nextButton.backgroundColor = .gray500
            nextButton.setTitleColor(.white000, for: .normal)
            nextButton.isEnabled = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
