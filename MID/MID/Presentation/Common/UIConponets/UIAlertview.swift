//
//  UIAlertview.swift
//  MID
//
//  Created by 천성우 on 5/17/24.
//

import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

enum alertViewType {
    case oneLine
    case twoLint
}

final class UIAlertview: BaseView {
    
    // MARK: - UI Components

    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let brView = UIView()
    private let cancelButton = UIButton()
    private let checkButton = UIButton()
    
    // MARK: - UI Components Property
    
    var alertType: alertViewType

    
    // MARK: - Initializer
    
    init(frame: CGRect, title: String, subTitle: String, alertType: alertViewType) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
        self.alertType = alertType
        super.init(frame: frame)
    }

    override func setStyles() {
        backgroundColor = .gray400
        layer.cornerRadius = 15
        
        titleLabel.do {
            $0.textColor = .white000
            $0.font = .fontGuide(.head4)
            $0.numberOfLines = 2
        }
        
        subTitleLabel.do {
            $0.textColor = .gray100
            $0.font = .fontGuide(.body3_reg)
        }
        
        brView.do {
            $0.backgroundColor = .gray300
        }
        
        cancelButton.do {
            $0.setTitle("취소", for: .normal)
            $0.titleLabel?.font = .fontGuide(.body1_bold)
            $0.titleLabel?.textColor = .red400
        }
        
        checkButton.do {
            $0.setTitle("확인", for: .normal)
            $0.titleLabel?.font = .fontGuide(.body1_bold)
            $0.titleLabel?.textColor = .gray100
        }
    }
    
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        switch alertType {
        case .oneLine:
            addSubviews(titleLabel, brView, cancelButton, checkButton)
            
            titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 34 / 812)
                $0.centerX.equalToSuperview()
            }
            
            brView.snp.makeConstraints {
                $0.bottom.equalToSuperview().offset(-SizeLiterals.Screen.screenHeight * 50 / 812)
                $0.horizontalEdges.equalToSuperview()
                $0.height.equalTo(1)
            }
            
            cancelButton.snp.makeConstraints {
                $0.bottom.equalToSuperview()
                $0.leading.equalToSuperview()
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 145 / 375)
            }
            
            checkButton.snp.makeConstraints {
                $0.bottom.equalToSuperview()
                $0.trailing.equalToSuperview()
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 145 / 375)
            }
            
            print("미아우 ㅋㅋ")
        case .twoLint:
            addSubviews(titleLabel, subTitleLabel, brView, cancelButton, checkButton)
            
            titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 34 / 812)
                $0.centerX.equalToSuperview()
            }
            
            subTitleLabel.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 18 / 812)
                $0.centerX.equalToSuperview()
            }
            
            brView.snp.makeConstraints {
                $0.bottom.equalToSuperview().offset(-SizeLiterals.Screen.screenHeight * 50 / 812)
                $0.horizontalEdges.equalToSuperview()
                $0.height.equalTo(1)
            }
            
            cancelButton.snp.makeConstraints {
                $0.bottom.equalToSuperview()
                $0.leading.equalToSuperview()
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 145 / 375)
            }
            
            checkButton.snp.makeConstraints {
                $0.bottom.equalToSuperview()
                $0.trailing.equalToSuperview()
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 145 / 375)
            }
        }
        

    }
    
    // MARK: - Methods

    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
