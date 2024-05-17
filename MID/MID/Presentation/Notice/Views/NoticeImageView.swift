//
//  NoticeImageView.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import SnapKit
import Then

final class NoticeImageView: BaseView {
    
    // MARK: - UI Components
    
    private let statusLabel = UILabel()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let dayLabel = UILabel()
    
    
    
    // MARK: - Initializer
    
    init(frame: CGRect, statusText: String, image: UIImage ,title: String, day: String) {
        super.init(frame: frame)
        statusLabel.text = statusText
        imageView.image = image
        titleLabel.text = title
        dayLabel.text = day
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - UI Components Property
    
    override func setStyles() {
        statusLabel.do {
            $0.textColor = .white000
            $0.font = .fontGuide(.detail2_bold)
        }
        // imageView의 색상은 이미지를 가지고 오기 전 임의 적용 값 입니다.
        imageView.do {
            $0.backgroundColor = .gray100
        }
        
        titleLabel.do {
            $0.textColor = .white000
            $0.font = .fontGuide(.detail2_reg)
        }
        
        dayLabel.do {
            $0.textColor = .white000
            $0.font = .fontGuide(.body2_bold)
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(statusLabel, imageView, titleLabel, dayLabel)
        
        statusLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(statusLabel.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 171.5 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 140 / 812)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 8 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 8 / 375)
        }
        
        dayLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 4 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 8 / 375)
        }
        
        
    }
    
    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
