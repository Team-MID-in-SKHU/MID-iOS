//
//  MoreButtonView.swift
//  MID
//
//  Created by 천성우 on 5/17/24.
//

import UIKit

import SnapKit
import Then

final class MoreButtonView: BaseView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let moreButton = UIButton()

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - UI Components Property
    
    override func setStyles() {
        backgroundColor = .gray600
        
        titleLabel.do {
            $0.text = "인기 프로그램"
            $0.textColor = .white000
            $0.font = .fontGuide(.head4)
        }
        
        moreButton.do {
            $0.setTitle("더보기 >", for: .normal)
            $0.titleLabel?.textColor = .white000
            $0.titleLabel?.font = .fontGuide(.body2_reg)
            $0.layer.cornerRadius = 4
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.white000.cgColor
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(titleLabel, moreButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 16 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 12 / 375)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 17 / 812)
            $0.trailing.equalToSuperview().offset(-SizeLiterals.Screen.screenHeight * 12 / 375)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 60 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 22 / 812)
        }
        
    }
    
    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
