//
//  CalendarView.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

final class CalendarView: BaseView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    let calendarView = UICalendarView()
    
    // MARK: - UI Components Property
    
    // MARK: - Initializer
    
    private var buttonStatus: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func setStyles() {
        backgroundColor = .gray600
        layer.cornerRadius = 10
        
        titleLabel.do {
            $0.text = "이달의 일정"
            $0.font = .fontGuide(.head1)
            $0.textColor = .white000
        }
        
        calendarView.do {
            $0.calendar = .current
            $0.locale = .current
            $0.fontDesign = .rounded
            $0.backgroundColor = .gray600
            $0.tintColor = .white000
        }
   
        


    }
    
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(titleLabel, calendarView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 11 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 21 / 375)
        }
        
        calendarView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 29 / 812)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Methods

    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
