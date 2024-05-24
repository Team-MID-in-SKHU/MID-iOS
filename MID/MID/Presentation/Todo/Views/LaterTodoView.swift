//
//  LaterTodoView.swift
//  MID
//
//  Created by 천성우 on 4/15/24.
//

import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

final class LaterTodoView: BaseView {
    
    // MARK: - UI Components
    
    let laterTodoTableView = UITableView()
    private let emptyView = UIEmptyView()
    
    // MARK: - UI Components Property

    
    // MARK: - Initializer
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func setStyles() {
        backgroundColor = .gray500
        layer.cornerRadius = 10
        
        
        laterTodoTableView.do {
            $0.rowHeight = SizeLiterals.Screen.screenHeight * 52 / 812
            $0.bounces = true
            $0.backgroundColor = .clear
            $0.separatorColor = .clear
            $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            $0.contentInset = .zero
            $0.isScrollEnabled = false
            $0.backgroundView = emptyView
        }
    }
    
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(laterTodoTableView)
        
        laterTodoTableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 11 / 812)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-SizeLiterals.Screen.screenHeight * 12 / 812)
        }
    }
    
    // MARK: - Methods

    // MARK: - @objc Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
