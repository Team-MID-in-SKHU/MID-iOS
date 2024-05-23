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
    private let laterTodoLabel = UILabel()
    private let laterTodoView = LaterTodoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.outputs.todayTodoList.subscribe(onNext: { menuList in
            print(menuList)
        }).disposed(by: disposeBag)
        
        print("나눠 주고 ~")
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "교내 모집공고 조회", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .white000
        
    }
    
    // MARK: - Properties

    
    override func bindViewModel() {
        titleView.buttonFrame.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.viewModel.inputs.lookUpButtonTap()
                self.pushToNoticeViewController()
            }
            .disposed(by: disposeBag)
                
        viewModel.outputs.todayTodoList
            .bind(to: todoView.todoTableView.rx.items(cellIdentifier: TodoListTableViewCell.className, cellType: TodoListTableViewCell.self)) { row, data, cell in
                if data.isEmpty {
                    self.todoView.todoTableView.backgroundView?.isHidden = false
                } else {
                    cell.configureWith(componentTitle: data)
                    self.todoView.todoTableView.backgroundView?.isHidden = true
                }
                cell.todoCheckButton.rx.tap
                    .bind { [weak self] in
                        guard let self else { return }
                        cell.setCheckButton()
                    }
                    .disposed(by: self.disposeBag)

            }
            .disposed(by: disposeBag)
        
        viewModel.outputs.laterTodoList
            .bind(to: laterTodoView.laterTodoTableView.rx.items(cellIdentifier: TodoListTableViewCell.className, cellType: TodoListTableViewCell.self)) { row, data, cell in
                cell.configureWith(componentTitle: data)
                if data.isEmpty {
                    self.laterTodoView.laterTodoTableView.backgroundView?.isHidden = false
                } else {
                    cell.configureWith(componentTitle: data)
                    self.laterTodoView.laterTodoTableView.backgroundView?.isHidden = true
                }
            }
            .disposed(by: disposeBag)
        
    }
    
    override func setStyles() {
        view.backgroundColor = .gray600
        
        laterTodoLabel.do {
            $0.text = "나중에 할 일"
            $0.textColor = .white000
            $0.font = .fontGuide(.head1)
        }
    }
    
    override func setLayout() {
        view.addSubviews(titleView, todoView, laterTodoLabel, laterTodoView)
        
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
        
        laterTodoLabel.snp.makeConstraints {
            $0.top.equalTo(todoView.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 11 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 21 / 375)
        }
        
        laterTodoView.snp.makeConstraints {
            $0.top.equalTo(laterTodoLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 11 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 21 / 375)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 333 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 197 / 812)
        }
    }
    
    override func setRegister() {
        todoView.todoTableView.register(TodoListTableViewCell.self, forCellReuseIdentifier: TodoListTableViewCell.className)
        laterTodoView.laterTodoTableView.register(TodoListTableViewCell.self, forCellReuseIdentifier: TodoListTableViewCell.className)
    }
    
    private func pushToNoticeViewController() {
        let vc = NoticeViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


