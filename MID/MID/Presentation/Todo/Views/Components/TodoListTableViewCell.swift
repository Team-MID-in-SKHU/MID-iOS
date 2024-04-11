//
//  TodoListTableViewCell.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import Then
import SnapKit

final class TodoListTableViewCell: UITableViewCell {
    
    private let todoTitleLabel = UILabel()
    private let todoCheckButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyles()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension TodoListTableViewCell {
    
    private func setStyles() {
        backgroundColor = .gray400
        selectionStyle = .none
        layer.cornerRadius = 10
        
        todoTitleLabel.do {
            $0.font = .fontGuide(.detail2_reg)
            $0.textColor = .white000
        }
        
        todoCheckButton.do {
            $0.setImage(ImageLiterals.Todo.checkBox_off, for: .normal)
        }
    }
    
//    func setAddTarget() {
//        todoCheckButton.addTarget(self, action: #selector(), for: .touchUpInside)
//    }
    
    
    private func setLayout() {
        addSubviews(todoTitleLabel, todoCheckButton)
        
        todoTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 11 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
            $0.centerY.equalToSuperview()
        }
        
        todoCheckButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 11 / 812)
            $0.trailing.equalToSuperview().offset(-SizeLiterals.Screen.screenWidth * 12 / 375)
            $0.centerY.equalToSuperview()
        }
    }
}

extension TodoListTableViewCell {
    
    func configureWith(componentTitle: String) {
        todoTitleLabel.text = componentTitle
    }
    
    func setCheckButton(complete: Bool) {
        complete ? todoCheckButton.setImage(ImageLiterals.Todo.checkBox_on, for: .normal) : todoCheckButton.setImage(ImageLiterals.Todo.checkBox_off, for: .normal)
    }
}
