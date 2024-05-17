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
    
    private let textImageView = UIImageView()
    private let searchBarSubTitle = UILabel()

    
    
    // MARK: - Initializer
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - UI Components Property
    
    override func setStyles() {
        backgroundColor = .gray600
        
        textImageView.do {
            $0.backgroundColor = .gray50
        }

        searchBarSubTitle.do {
            $0.text = "교내에서 모집 중인 프로그램을 찾아보세요"
            $0.textColor = .gray50
            $0.font = .fontGuide(.detail2_reg)
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(textImageView, searchBarSubTitle)
        
        textImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 36 / 812)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 351 / 375)
        }
        
        searchBarSubTitle.snp.makeConstraints {
            $0.top.equalTo(textImageView.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 4 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
        }
    }
    
    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
