//
//  CalendarView.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import SnapKit
import Then

final class CalendarView: BaseView {
    
    // MARK: - UI Components
    
    
    // MARK: - UI Components Property
    
    // MARK: - Initializer
    
    private var buttonStatus: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func setStyles() {
        backgroundColor = .gray600
        layer.cornerRadius = 10
        

    }
    
    
    // MARK: - Layout Helper
    
    override func setLayout() {
//        addSubviews(titleLabel)
//        
//        titleLabel.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 11 / 812)
//            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 21 / 375)
//        }
// 
    }
    
    // MARK: - Methods

    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
