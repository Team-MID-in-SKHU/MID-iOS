//
//  UserInfoView.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import SnapKit
import Then

final class UserInfoView: BaseView {
    
    // MARK: - UI Components
    
    private var userImage = UIImageView()
    private var userName = UILabel()
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - UI Components Property
    
    override func setStyles() {
        userImage.do {
            $0.image = ImageLiterals.MyPage.userImage
        }
        
        userName.do {
            $0.text = "MID님의 마이페이지"
            $0.font = .systemFont(ofSize: 24)
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
    }
    
    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
