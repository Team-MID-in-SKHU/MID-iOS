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
    private let withdrawalButton = UIButton()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.outputs.myPageMenuList.subscribe(onNext: { menuList in
            print(menuList)
        }).disposed(by: disposeBag)
        
    }
    
    // MARK: - Properties
    
    override func bindViewModel() {
        
        myPageListTableView.rx.itemSelected
            .bind { [weak self] indexPath in
                guard let self else { return }
                let row = indexPath.row
                let input = self.viewModel.inputs
                switch row {
                case 0:
                    // 내 정보 보기
                    input.myInformationDidTap()
                case 1:
                    // 관심사 수정
                    input.interestModifyDidTap()
                case 2:
                    // 푸쉬알림 설정
                    input.pushAlarmDidTap()
                case 3:
                    // 로그아웃
                    input.logOutDidTap()
                    self.logoutSuccess()
                default:
                    break
                }
            }
            .disposed(by: disposeBag)
        
        withdrawalButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.viewModel.inputs.withdrawalDidTap()
            }
            .disposed(by: disposeBag)
        
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
            $0.isScrollEnabled = false
        }
        
        withdrawalButton.do {
            $0.setTitle("회원 탈퇴", for: .normal)
            $0.setTitleColor(.gray300, for: .normal)
            $0.titleLabel?.font = .fontGuide(.detail3_reg)
            $0.setUnderline()
        }
    }
    
    override func setLayout() {
        view.addSubviews(myPageProfileView, myPageListTableView, withdrawalButton)
        
        myPageProfileView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(SizeLiterals.Screen.screenHeight * 0.0602)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 0.203)
        }
        
        myPageListTableView.snp.makeConstraints {
            $0.top.equalTo(myPageProfileView.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 0.0369)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 0.2956)
        }
        
        withdrawalButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(18)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(12)
            $0.height.equalTo(21)
            $0.width.equalTo(44)
        }
    }
    
    override func setRegister() {
        myPageListTableView.register(MyPageListTableViewCell.self, forCellReuseIdentifier: MyPageListTableViewCell.className)
    }
    
    private func logoutSuccess() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            let vc = LoginViewController()
            let rootVC = UINavigationController(rootViewController: vc)
            rootVC.navigationController?.isNavigationBarHidden = true
            window.rootViewController = rootVC
            window.makeKeyAndVisible()
        }
    }
}
