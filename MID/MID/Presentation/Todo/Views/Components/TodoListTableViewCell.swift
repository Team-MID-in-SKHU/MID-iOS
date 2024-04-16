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
    
    
    private let todoTableFrame = UIView()
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
        backgroundColor = .clear
        selectionStyle = .none
        
        todoTableFrame.do {
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .gray400
        }
        
        todoTitleLabel.do {
            $0.font = .fontGuide(.detail2_reg)
            $0.textColor = .white000
        }
        
        todoCheckButton.do {
            $0.setImage(ImageLiterals.Todo.checkBox_off, for: .normal)
        }
    }
    
    func setAddTarget() {
        todoCheckButton.addTarget(self, action: #selector(setCheckButton), for: .touchUpInside)
    }
    
    
    private func setLayout() {
        addSubviews(todoTableFrame)
        todoTableFrame.addSubviews(todoTitleLabel, todoCheckButton)
        
        todoTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
        }
        
        todoCheckButton.snp.makeConstraints {
            $0.centerY.equalTo(todoTitleLabel.snp.centerY).offset(SizeLiterals.Screen.screenHeight * 4 / 812)
            $0.trailing.equalToSuperview().offset(-SizeLiterals.Screen.screenWidth * 12 / 375)
        }
        
        todoTableFrame.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 6 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 7 / 375)
            $0.bottom.equalToSuperview().offset(-SizeLiterals.Screen.screenHeight * 6 / 812)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 319 / 375)
        }
        
    }
}

extension TodoListTableViewCell {
    
    func configureWith(componentTitle: String) {
        todoTitleLabel.text = componentTitle
    }
//    
//    func configureLater(data: [DayTodo]) {
//        todoTitleLabel.text = data.todos.
//    }
    
    @objc
    func setCheckButton(complete: Bool) {
        complete ? todoCheckButton.setImage(ImageLiterals.Todo.checkBox_on, for: .normal) : todoCheckButton.setImage(ImageLiterals.Todo.checkBox_off, for: .normal)
    }
}
