//
//  LaterTodoListTableHeaderView.swift
//  MID
//
//  Created by 천성우 on 4/15/24.
//

import UIKit

import Then
import SnapKit

final class LaterTodoListTableHeaderView: UITableViewHeaderFooterView {
    
    private let dateLabel = UILabel()
    private let dayLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setStyles()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension LaterTodoListTableHeaderView {
    
    private func setStyles() {
        backgroundColor = .clear
        
        dateLabel.do {
            $0.font = .fontGuide(.head4)
            $0.textColor = .white000
        }
        
        dayLabel.do {
            $0.font = .fontGuide(.detail2_reg)
            $0.textColor = .gray200
        }
    }
    
    
    
    private func setLayout() {
        addSubviews(dateLabel, dayLabel)
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 12 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
        }
        
        dayLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
        }
    }
}

extension LaterTodoListTableHeaderView {
    func configureWith(date: String, day: String) {
        dateLabel.text = "D-\(date)"
        dayLabel.text = day
    }
}
