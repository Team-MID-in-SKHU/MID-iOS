//
//  TodoViewController.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class TodoViewController: BaseViewController {

    
    private let viewModel = TodoViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let titleView = LookUpButtonView()
    private let todoView = TodoView()
    private let laterTodoView = LaterTodoView()
    
    private let dummy = dummyLaterTodoData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.outputs.todayTodoList.subscribe(onNext: { menuList in
            print(menuList)
        }).disposed(by: disposeBag)
        
        print(dummy.dayTodo1)
    }
    
    // MARK: - Properties

    
    override func bindViewModel() {
        titleView.buttonFrame.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.viewModel.inputs.lookUpButtonTap()
            }
            .disposed(by: disposeBag)
        
        viewModel.outputs.todayTodoList
            .bind(to: todoView.todoTableView.rx.items(cellIdentifier: TodoListTableViewCell.className, cellType: TodoListTableViewCell.self)) { row, data, cell in
                cell.configureWith(componentTitle: data)
            }
            .disposed(by: disposeBag)
    }
    
    override func setStyles() {
        view.backgroundColor = .gray600
    }
    
    override func setLayout() {
        view.addSubviews(titleView, todoView)
        
        titleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(SizeLiterals.Screen.screenHeight * 0.01355)
            $0.leading.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 0.888)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 0.117)
        }
        
        todoView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 31 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 21 / 375)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 333 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 197 / 812)
        }
    }
    
    override func setRegister() {
        todoView.todoTableView.register(TodoListTableViewCell.self, forCellReuseIdentifier: TodoListTableViewCell.className)
    }
}

