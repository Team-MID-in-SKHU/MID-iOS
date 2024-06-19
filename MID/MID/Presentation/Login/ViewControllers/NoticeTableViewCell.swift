//
//  NoticeTableViewCell.swift
//  MID
//
//  Created by 천성우 on 6/19/24.
//

import UIKit

import Then
import SnapKit

final class NoticeTableViewCell: UITableViewCell {

    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let topBorder = UIView()
    private let bottomBorder = UIView()
    
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyles()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension NoticeTableViewCell {
    
    private func setStyles() {
        backgroundColor = .clear
        selectionStyle = .none
        
        titleLabel.do {
            $0.textColor = .white000
            $0.font = .fontGuide(.detail1_bold)
        }

        subTitleLabel.do {
            $0.textColor = .gray50
            $0.font = .fontGuide(.detail2_reg)
        }
        
        topBorder.do {
            $0.backgroundColor = .gray200
        }
        
        bottomBorder.do {
            $0.backgroundColor = .gray200
        }
    }
    
    
    private func setLayout() {
        contentView.addSubviews(titleLabel, subTitleLabel, topBorder, bottomBorder)
        
        topBorder.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 1 / 812)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 12 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 1 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
        }
        
        bottomBorder.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 1 / 812)
        }
    }
}

extension NoticeTableViewCell {
    
    func configureWith(data: NoticeListResponseBody) {
        titleLabel.text = data.title
        subTitleLabel.text = data.subTitle
    }
}
