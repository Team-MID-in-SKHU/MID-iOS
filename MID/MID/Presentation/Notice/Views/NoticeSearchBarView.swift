//
//  NoticeSearchBarView.swift
//  MID
//
//  Created by 천성우 on 5/17/24.
//

import UIKit

import SnapKit
import Then

final class NoticeSearchBarView: BaseView {
    
    // MARK: - UI Components
    
    private let searchTextFieldFrame = UIView()
    let searchTextField = UITextField()
    let searchButton = UIButton()
    private let searchBarSubTitle = UILabel()

    
    
    // MARK: - Initializer
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - UI Components Property
    
    override func setStyles() {
        backgroundColor = .gray600
        
        searchTextFieldFrame.do {
            $0.backgroundColor = .gray600
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray250.cgColor
        }

        searchTextField.do {
            $0.placeholder = "검색어를 입력하세요"
            $0.setPlaceholderColor(.gray50)
            $0.setLeftPadding(amount: 12)
            $0.font = .fontGuide(.body3_reg)
            $0.textColor = .white000
        }
        
        searchButton.do {
            $0.setImage(ImageLiterals.searchIcon, for: .normal)
        }
        
        searchBarSubTitle.do {
            $0.text = "교내에서 모집 중인 프로그램을 찾아보세요"
            $0.textColor = .gray50
            $0.font = .fontGuide(.detail2_reg)
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(searchTextFieldFrame, searchBarSubTitle)
        searchTextFieldFrame.addSubviews(searchTextField, searchButton)
        
        searchTextFieldFrame.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 36 / 812)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 351 / 375)
        }
        
        searchBarSubTitle.snp.makeConstraints {
            $0.top.equalTo(searchTextFieldFrame.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 4 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
        }
        
        searchTextField.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 295 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 20 / 812)
        }
        
        searchButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-SizeLiterals.Screen.screenWidth * 4 / 375)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 36 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 26 / 812)
        }
    }
    
    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
