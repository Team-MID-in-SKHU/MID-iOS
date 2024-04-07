//
//  MyPageViewController.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class MyPageViewController: BaseViewController {
    
    
    private let viewModel = MyPageViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let myPageProfileView = UserInfoView()
    private let myPageListTableView = UITableView()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.outputs.myPageMenuList.subscribe(onNext: { menuList in
            print(menuList)
        }).disposed(by: disposeBag)
        
    }
    
    // MARK: - Properties
    
    override func bindViewModel() {
        viewModel.outputs.myPageMenuList
            .bind(to: myPageListTableView.rx.items(cellIdentifier: MyPageListTableViewCell.className, cellType: MyPageListTableViewCell.self)) { row, data, cell in
                cell.configureWith(componentTitle: data)
                if row == 3 {
                    cell.setLogOutStyle()
                }
            }
            .disposed(by: disposeBag)
    }
    
    override func setStyles() {
        view.backgroundColor = .gray600
        
        myPageListTableView.do {
            $0.rowHeight = SizeLiterals.Screen.screenHeight * 0.0739
            $0.bounces = true
            $0.backgroundColor = .gray600
            $0.separatorColor = .gray400
            $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            $0.contentInset = .zero
        }
    }
    
    override func setLayout() {
        view.addSubviews(myPageProfileView, myPageListTableView)
        
        myPageProfileView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(SizeLiterals.Screen.screenHeight * 0.0602)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 0.203)
        }
        
        myPageListTableView.snp.makeConstraints {
            $0.top.equalTo(myPageProfileView.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 0.0369)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func setRegister() {
        myPageListTableView.register(MyPageListTableViewCell.self, forCellReuseIdentifier: MyPageListTableViewCell.className)
    }
}
