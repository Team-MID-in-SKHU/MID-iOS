//
//  MonthTodoListViewCell.swift
//  MID
//
//  Created by 천성우 on 4/28/24.
//

import UIKit

import SnapKit
import Then

final class MonthTodoListViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let topBorder = UIView()
    private let bottomBorder = UIView()
    let checkButton = UIButton()
    
    var toggleInput: Bool = true
    
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyles()
        setLayout()
        setAddTarget()
    }
    
    // MARK: - UI Components Property
    
    private func setStyles() {
        backgroundColor = .gray500

        
        titleLabel.do {
            $0.text = "테스트 타이틀"
            $0.textColor = .white000
            $0.font = .fontGuide(.detail2_bold)
        }
        
//        subTitleLabel.do {
//            $0.text = "테스트 서브 타이틀"
//            $0.textColor = .gray200
//            $0.font = .fontGuide(.detail3_reg)
//        }
        
        checkButton.do {
            $0.setImage(ImageLiterals.Todo.checkBox_off, for: .normal)
//            $0.isUserInteractionEnabled = true
        }
        
        topBorder.do {
            $0.backgroundColor = .gray200
        }
        
        bottomBorder.do {
            $0.backgroundColor = .gray200
        }

    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(titleLabel, checkButton, topBorder, bottomBorder)
        
        topBorder.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 1 / 812)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
//            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 21 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
        }
        
//        subTitleLabel.snp.makeConstraints {
//            $0.top.equalTo(titleLabel.snp.bottom)
//            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
//        }
        
        checkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-SizeLiterals.Screen.screenWidth * 14 / 375)
            $0.centerY.equalToSuperview()
        }
        
        bottomBorder.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 1 / 812)
        }
        
    }
    
    func setAddTarget() {
        checkButton.addTarget(self, action: #selector(setCheckButton), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc
    func setCheckButton() {
        self.toggleInput ? checkButton.setImage(ImageLiterals.Todo.checkBox_on, for: .normal) : checkButton.setImage(ImageLiterals.Todo.checkBox_off, for: .normal)
        toggleInput.toggle()
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MonthTodoListViewCell {
    func configureWith(title: String) {
        titleLabel.text = title
//        subTitleLabel.text = subTitle
    }
}

