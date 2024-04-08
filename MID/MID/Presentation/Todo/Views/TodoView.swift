//
//  TodoView.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import SnapKit
import Then

final class TodoView: BaseView {
    
    // MARK: - UI Components
    
    private let buttonLabel = UILabel()
    private let checkButton = UIButton()
        
    // MARK: - Initializer
    
    private var buttonStatus: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - UI Components Property
    
    override func setStyles() {
        buttonLabel.do {
            $0.font = .fontGuide(.detail2_reg)
            $0.textColor = .white000
        }
        
        checkButton.do {
            $0.setImage(ImageLiterals.Todo.checkBox_off, for: .normal)
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
    }
    
    // MARK: - Methods
    
    func setAddTarget() {
        checkButton.addTarget(self, action: #selector(todoCheckButtonTogle), for: .touchUpInside)
    }
    
    func todoStatus() {
        buttonStatus ? checkButton.setImage(ImageLiterals.Todo.checkBox_on, for: .normal) : checkButton.setImage(ImageLiterals.Todo.checkBox_off, for: .normal)
    }

    // MARK: - @objc Methods
    
    @objc func todoCheckButtonTogle() {
        self.buttonStatus.toggle()
        self.todoStatus()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
