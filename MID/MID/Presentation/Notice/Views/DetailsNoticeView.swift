//
//  DetailsNoticeView.swift
//  MID
//
//  Created by 천성우 on 5/31/24.
//

import UIKit

import SnapKit
import Then

final class DetailsNoticeView: BaseView {
    
    // MARK: - UI Components
    


    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - UI Components Property
    
    override func setStyles() {
        backgroundColor = .gray600
        
        
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {}
    
    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

