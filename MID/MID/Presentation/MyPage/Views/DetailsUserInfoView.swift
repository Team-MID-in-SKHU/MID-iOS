//
//  EditUserInfoView.swift
//  MID
//
//  Created by 천성우 on 5/23/24.
//

import UIKit

import SnapKit
import Then

final class DetailsUserInfoView: BaseView {
    
    // MARK: - UI Components
    
    private var userImage = UIImageView()
    private var userName = UILabel()
    private let userNameTextField = UnderLineTextField()
    private let userDepartment = UILabel()
    private let userDepartmentTextField = UnderLineTextField()
    let withdrawalButton = UIButton()

    // MARK: - Properties

    private let userNameString: String
    private let userDepartmnetString: String

    
    // MARK: - Initializer
    
    init(frame: CGRect, name: String, department: String) {
        self.userDepartmnetString = department
        self.userNameString = name
        super.init(frame: frame)
    }
    
    // MARK: - UI Components Property
    
    override func setStyles() {
        userImage.do {
            $0.image = ImageLiterals.MyPage.userImage
        }
        
        userName.do {
            $0.text = "이름"
            $0.font = .fontGuide(.head4)
            $0.textColor = .white000
        }
        
        userNameTextField.do {
            $0.setPlaceholder(
                placeeholder: userNameString,
                color: .white000
            )
            $0.font = .fontGuide(.body3_bold)
            $0.isUserInteractionEnabled = false
        }
        
        userDepartment.do {
            $0.text = "전공 및 소속"
            $0.font = .fontGuide(.head4)
            $0.textColor = .white000
        }
        
        userDepartmentTextField.do {
            $0.setPlaceholder(
                placeeholder: userDepartmnetString,
                color: .white000
            )
            $0.font = .fontGuide(.body3_bold)
            $0.isUserInteractionEnabled = false
        }
        
        withdrawalButton.do {
            $0.setTitle("회원 탈퇴", for: .normal)
            $0.setTitleColor(.gray300, for: .normal)
            $0.titleLabel?.font = .fontGuide(.detail3_reg)
            $0.setUnderline()
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(userImage, userName, userNameTextField, userDepartment, userDepartmentTextField, withdrawalButton)
        
        userImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 20 / 812)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(SizeLiterals.Screen.screenHeight * 68 / 812)
        }
        
        userName.snp.makeConstraints {
            $0.top.equalTo(userImage.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 39 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 18 / 375)
        }
        
        userNameTextField.snp.makeConstraints {
            $0.top.equalTo(userName.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 15 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 18 / 375)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 339 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 48 / 812)
        }
        
        userDepartment.snp.makeConstraints {
            $0.top.equalTo(userNameTextField.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 39 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 18 / 375)
        }
        
        userDepartmentTextField.snp.makeConstraints {
            $0.top.equalTo(userDepartment.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 15 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 18 / 375)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 339 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 48 / 812)
        }
        
        withdrawalButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-SizeLiterals.Screen.screenWidth * 30 / 375)
            $0.bottom.equalToSuperview().offset(-SizeLiterals.Screen.screenHeight * 30 / 812)
            $0.height.equalTo(21)
            $0.width.equalTo(44)
        }
    }
    
    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
