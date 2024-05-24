//
//  UIEmptyView.swift
//  MID
//
//  Created by 천성우 on 5/23/24.
//

import UIKit

import SnapKit
import Then

final class UIEmptyView: BaseView {
    
    // MARK: - UI Components

    let emptyLabel = UILabel()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    

    // MARK: - UI Components Property
    
    override func setStyles() {
        backgroundColor = .gray500

        emptyLabel.do {
            $0.text = "아직 추가된 할 일이 없어요"
            $0.textColor = .gray200
            $0.font = .fontGuide(.body1_reg)
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(emptyLabel)
        
        emptyLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - Methods
          
    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
