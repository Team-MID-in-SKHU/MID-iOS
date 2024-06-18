//
//  UIInterestsButton.swift
//  MID
//
//  Created by 천성우 on 5/24/24.
//

import UIKit

import SnapKit
import Then

final class UIInterestsButton: BaseView {
    
    // MARK: - UI Components
    
    private let buttonTitleLabel = UILabel()
    
    // MARK: - Properties
    
    var buttonStatus: Bool = false
    
    // MARK: - Initializer
    
    init(frame: CGRect, buttonTitle: String) {
        self.buttonTitleLabel.text = buttonTitle
        super.init(frame: frame)
        setupGesture()
    }
    

    // MARK: - UI Components Property
    
    override func setStyles() {
        backgroundColor = .white000
        layer.cornerRadius = 15
        
        buttonTitleLabel.do {
            $0.textColor = .diamon700
            $0.font = .fontGuide(.body2_bold)
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(buttonTitleLabel)
        
        buttonTitleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setupGesture() {
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapButton))
         self.addGestureRecognizer(tapGesture)
     }
          
    // MARK: - @objc Methods
    
    @objc
    func tapButton() {
        buttonStatus.toggle()
        buttonTitleLabel.textColor = buttonStatus ? .white000 : .diamon700
        backgroundColor = buttonStatus ? .diamon700 : .white000
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
