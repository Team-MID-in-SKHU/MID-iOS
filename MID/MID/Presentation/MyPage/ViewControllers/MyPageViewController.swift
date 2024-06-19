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

    // MARK: - Properties

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    
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
                    self.pushToDetailsUserInfoViewController()
                case 1:
                    // 관심사 수정
                    self.didTapInterest()
                case 2:
                    // 푸쉬알림 설정
                    input.pushAlarmDidTap()
                case 3:
                    // 로그아웃
                    self.didTapLogOut()
                default:
                    break
                }
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
        viewModel.outputs.userInfo
            .bind(onNext: { [weak self] data in
            
            })
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
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 0.2956)
        }
    }
    
    override func setRegister() {
        myPageListTableView.register(MyPageListTableViewCell.self, forCellReuseIdentifier: MyPageListTableViewCell.className)
    }
    
    private func setData() {
        let userName = UserDefaults.standard.string(forKey: StringLiterals.Auth.userName) ?? ""
        myPageProfileView.userNameLabel.text = "\(userName)님의 마이페이지"
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
    
    private func didTapLogOut() {
        let finishedAlertView = MyPageAlertViewController(alertType: .logOut, viewModel: self.viewModel)
        finishedAlertView.modalPresentationStyle = .overFullScreen
        self.present(finishedAlertView, animated: false)
    }
    
    private func didTapInterest() {
        let finishedAlertView = MyPageAlertViewController(alertType: .select, viewModel: self.viewModel)
        finishedAlertView.modalPresentationStyle = .overFullScreen
        self.present(finishedAlertView, animated: false)
    }
    
    private func pushToDetailsUserInfoViewController() {
        let vc = DetailsUserInfoViewController(viewModel: self.viewModel)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "내 정보 조회", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .white000
    }
}
