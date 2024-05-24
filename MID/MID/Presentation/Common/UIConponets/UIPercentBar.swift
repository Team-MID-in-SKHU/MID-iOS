//
//  UIPercentBar.swift
//  MID
//
//  Created by 천성우 on 5/14/24.
//

import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

final class UIPercentBar: BaseView {
    
    // MARK: - UI Components

    private let percentBarView = UIView()
    
    // MARK: - UI Components Property
    
    private var percentValue: Double = 0.0

    
    // MARK: - Initializer
    
    init(frame: CGRect, percentValue: Double) {
        self.percentValue = percentValue
        super.init(frame: frame)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func setStyles() {
        backgroundColor = .gray100
        layer.cornerRadius = 8
        
        percentBarView.do {
            $0.backgroundColor = .white000
            $0.layer.cornerRadius = 8
        }
    }
    
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(percentBarView)
        
        percentBarView.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(self.percentValue)
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Methods

    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
