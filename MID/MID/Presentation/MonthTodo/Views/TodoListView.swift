//
//  TodoListView.swift
//  MID
//
//  Created by 천성우 on 4/28/24.
//

import UIKit

import SnapKit
import Then

final class TodoListView: BaseView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let checkButton = UIButton()
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - UI Components Property
    
    override func setStyles() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray200.cgColor
        
        titleLabel.do {
            $0.textColor = .white000
            $0.font = .fontGuide(.detail2_bold)
        }
        
        subTitleLabel.do {
            $0.textColor = .gray200
            $0.font = .fontGuide(.detail3_reg)
        }
        
        checkButton.do {
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.white000.cgColor
            $0.layer.cornerRadius = 2
        }

    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(titleLabel, subTitleLabel, checkButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 21 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
        }
        
        checkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-SizeLiterals.Screen.screenWidth * 14 / 375)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(19)
        }
        
    }
    
    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
