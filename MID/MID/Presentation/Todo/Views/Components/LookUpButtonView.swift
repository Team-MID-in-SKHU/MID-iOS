//
//  LookUpButtonView.swift
//  MID
//
//  Created by 천성우 on 4/8/24.
//

import UIKit

import SnapKit
import Then

final class LookUpButtonView: BaseView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    let buttonFrame = UIButton()
    private let buttonLabel = UILabel()
    private let imageView = UIImageView()
        
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - UI Components Property
    
    override func setStyles() {
        titleLabel.do {
            $0.text = "나의 할 일"
            $0.textColor = .white000
            $0.font = .fontGuide(.head1)
        }
        
        buttonFrame.do {
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .gray500
        }
        
        
        buttonLabel.do {
            $0.text = "교내 모집공고 조회하기"
            $0.font = .fontGuide(.head4)
            $0.textColor = .white000
        }
        
        imageView.do {
            $0.image = ImageLiterals.Todo.vector
            $0.contentMode = .scaleAspectFit
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(titleLabel, buttonFrame)
        buttonFrame.addSubviews(buttonLabel, imageView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 0.056)
        }
        
        buttonFrame.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 0.01355)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 0.056)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 0.888)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 0.0591)
        }
        
        buttonLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 0.02933)
            $0.centerY.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-SizeLiterals.Screen.screenWidth * 0.02933)
            $0.centerY.equalToSuperview()
        }
    }

    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
