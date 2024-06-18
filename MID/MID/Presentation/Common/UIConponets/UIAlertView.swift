//
//  UIAlertView.swift
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
    case twoLine
    case selectInterests
    case failLogin
}

final class UIAlertView: BaseView {
    
    // MARK: - UI Components
    
    private let alertTitleLabel = UILabel()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let brView = UIView()
    private let lineView = UIView()
    let cancelButton = UIButton()
    let checkButton = UIButton()
    
    private let academicButton = UIInterestsButton(frame: .zero, buttonTitle: "학사일정")
    private let studentCouncilButton = UIInterestsButton(frame: .zero, buttonTitle: "학생회")
    private let clubButton = UIInterestsButton(frame: .zero, buttonTitle: "동아리")
    private let smallGatheringButton = UIInterestsButton(frame: .zero, buttonTitle: "소모임")
    private let semiClubButton = UIInterestsButton(frame: .zero, buttonTitle: "준동아리")
    private let outsideClubButton = UIInterestsButton(frame: .zero, buttonTitle: "대외동아리")
    
    
    //    동아리 소모임 준동아리 대외동아리
    
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
        
        switch alertType {
        case .oneLine, .twoLine, .failLogin:
            
            titleLabel.do {
                $0.textColor = .white000
                $0.font = .fontGuide(.head4)
                $0.numberOfLines = 2
            }
            
            subTitleLabel.do {
                $0.textColor = .gray100
                $0.font = .fontGuide(.body3_reg)
            }
            
        case .selectInterests:
            
            alertTitleLabel.do {
                $0.text = "관심 주제 설정"
                $0.textColor = .white000
                $0.font = .fontGuide(.head2)
            }
            
            titleLabel.do {
                $0.text = "공개 일정"
                $0.textColor = .white000
                $0.font = .fontGuide(.head4)
            }
            
            subTitleLabel.do {
                $0.text = "개인 일정"
                $0.textColor = .white000
                $0.font = .fontGuide(.head4)
            }
        }
        brView.do {
            $0.backgroundColor = .gray300
        }
        
        lineView.do {
            $0.backgroundColor = .gray300
        }
        
        cancelButton.do {
            $0.setTitle("취소", for: .normal)
            $0.titleLabel?.font = .fontGuide(.body1_bold)
            $0.setTitleColor(.red400, for: .normal)
        }
        
        checkButton.do {
            $0.setTitle("확인", for: .normal)
            $0.titleLabel?.font = .fontGuide(.body1_bold)
            $0.setTitleColor(.gray100, for: .normal)
            
        }
    }
    
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        switch alertType {
        case .oneLine:
            addSubviews(titleLabel, brView, lineView, cancelButton, checkButton)
            
            titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 34 / 812)
                $0.centerX.equalToSuperview()
            }
            
            brView.snp.makeConstraints {
                $0.bottom.equalToSuperview().offset(-SizeLiterals.Screen.screenHeight * 50 / 812)
                $0.horizontalEdges.equalToSuperview()
                $0.height.equalTo(1)
            }
            
            lineView.snp.makeConstraints {
                $0.top.equalTo(cancelButton.snp.top)
                $0.centerX.equalToSuperview()
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
                $0.width.equalTo(1)
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
            
        case .twoLine:
            addSubviews(titleLabel, subTitleLabel, brView, lineView, cancelButton, checkButton)
            
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
            
            lineView.snp.makeConstraints {
                $0.top.equalTo(cancelButton.snp.top)
                $0.centerX.equalToSuperview()
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
                $0.width.equalTo(1)
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
            
        case .failLogin:
            addSubviews(titleLabel, subTitleLabel, brView, checkButton)
            
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

            
            checkButton.snp.makeConstraints {
                $0.bottom.equalToSuperview()
                $0.trailing.equalToSuperview()
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
                $0.width.equalToSuperview()
            }
            
        case .selectInterests:
            addSubviews(alertTitleLabel, titleLabel, academicButton,
                        studentCouncilButton, subTitleLabel, clubButton, smallGatheringButton,
                        semiClubButton, outsideClubButton,brView,
                        lineView, cancelButton, checkButton)
            
            alertTitleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 10 / 812)
                $0.centerX.equalToSuperview()
            }
            
            titleLabel.snp.makeConstraints {
                $0.top.equalTo(alertTitleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 15 / 812)
                $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 20 / 375)
            }
            
            academicButton.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 10 / 812)
                $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 15 / 375)
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 80 / 375)
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 30 / 812)
            }
            
            studentCouncilButton.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 10 / 812)
                $0.leading.equalTo(academicButton.snp.trailing).offset(SizeLiterals.Screen.screenWidth * 15 / 375)
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 80 / 375)
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 30 / 812)
            }
            
            subTitleLabel.snp.makeConstraints {
                $0.top.equalTo(academicButton.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 15 / 812)
                $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 20 / 375)
            }
            
            clubButton.snp.makeConstraints {
                $0.top.equalTo(subTitleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 15 / 812)
                $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 15 / 375)
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 80 / 375)
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 30 / 812)
            }
            
            smallGatheringButton.snp.makeConstraints {
                $0.top.equalTo(subTitleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 15 / 812)
                $0.leading.equalTo(clubButton.snp.trailing).offset(SizeLiterals.Screen.screenWidth * 15 / 375)
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 80 / 375)
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 30 / 812)
            }
            
            semiClubButton.snp.makeConstraints {
                $0.top.equalTo(subTitleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 15 / 812)
                $0.leading.equalTo(smallGatheringButton.snp.trailing).offset(SizeLiterals.Screen.screenWidth * 15 / 375)
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 80 / 375)
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 30 / 812)
            }
            
            outsideClubButton.snp.makeConstraints {
                $0.top.equalTo(clubButton.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 10 / 812)
                $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 15 / 375)
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 80 / 375)
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 30 / 812)
            }
            
            brView.snp.makeConstraints {
                $0.bottom.equalToSuperview().offset(-SizeLiterals.Screen.screenHeight * 50 / 812)
                $0.horizontalEdges.equalToSuperview()
                $0.height.equalTo(1)
            }
            
            lineView.snp.makeConstraints {
                $0.top.equalTo(cancelButton.snp.top)
                $0.centerX.equalToSuperview()
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
                $0.width.equalTo(1)
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
