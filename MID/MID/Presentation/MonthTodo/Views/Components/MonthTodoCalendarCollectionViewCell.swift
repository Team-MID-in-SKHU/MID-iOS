//
//  MonthTodoCalendarCollectionViewCell.swift
//  MID
//
//  Created by 천성우 on 4/19/24.
//


import UIKit

import Then
import SnapKit

final class CalendarCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CalendarCollectionViewCell"
    
    private lazy var dayLabel = UILabel()
    private let toDay = UIView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setStyle()
        setLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        backgroundColor = .gray600
//        layer.borderWidth = 1
//        layer.borderColor = UIColor.gray200.cgColor
        dayLabel.do {
            $0.font = .fontGuide(.detail2_reg)
            $0.textColor = .white000
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        toDay.do {
            $0.backgroundColor = .red300
            $0.layer.cornerRadius = 12.5
            $0.isHidden = true
        }
    }
    
    private func setLayout() {
        addSubviews(toDay, dayLabel)
        
        dayLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 5 / 812)
            $0.centerX.equalToSuperview()
        }
        
        toDay.snp.makeConstraints {
            $0.centerX.equalTo(dayLabel.snp.centerX)
            $0.width.height.equalTo(25)
        }

    }
    
    func todayDisplay() {
        toDay.isHidden = false
    }
    
    func unTodayDisplay() {
        toDay.isHidden = true
    }
    
    func update(day: String) {
        self.dayLabel.text = day
    }
}
