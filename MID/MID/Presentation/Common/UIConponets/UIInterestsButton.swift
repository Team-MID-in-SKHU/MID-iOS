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
    }
    

    // MARK: - UI Components Property
    
    override func setStyles() {
        addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(tapButton)))
        backgroundColor = .white000
        layer.cornerRadius = 15
        
        buttonTitleLabel.do {
            $0.textColor = .diamon000
            $0.font = .fontGuide(.body2_bold)
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
    }
    
    // MARK: - Methods
          
    // MARK: - @objc Methods
    
    @objc
    func tapButton() {
        buttonStatus.toggle()
        buttonTitleLabel.textColor = buttonStatus ? .white000 : .diamon000
        backgroundColor = buttonStatus ? .diamon000 : .white000
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
