//
//  TodoView.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

final class TodoView: BaseView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let todayLabel = UILabel()
    let todoTableView = UITableView()
    
    // MARK: - UI Components Property

    let dateText = String.koreanFormattedDate()
    
    // MARK: - Initializer
    
    private var buttonStatus: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func setStyles() {
        backgroundColor = .gray500
        layer.cornerRadius = 10
        
        titleLabel.do {
            $0.text = "오늘"
            $0.font = .fontGuide(.head4)
            $0.textColor = .red500
        }
        
        todayLabel.do {
            $0.text = dateText
            $0.font = .fontGuide(.detail2_reg)
            $0.textColor = .gray200
        }
        
        todoTableView.do {
            $0.rowHeight = SizeLiterals.Screen.screenHeight * 52 / 812
            $0.bounces = true
            $0.backgroundColor = .clear
            $0.separatorColor = .clear
            $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            $0.contentInset = .zero
            $0.isScrollEnabled = false
        }
    }
    
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(titleLabel, todayLabel, todoTableView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 12 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
        }
        
        todayLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
        }
        
        todoTableView.snp.makeConstraints {
            $0.top.equalTo(todayLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 12 / 812)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods

    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
