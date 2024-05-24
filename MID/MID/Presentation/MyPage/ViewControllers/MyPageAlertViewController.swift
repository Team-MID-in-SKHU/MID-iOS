//
//  MyPageAlertViewController.swift
//  MID
//
//  Created by 천성우 on 5/20/24.
//

import UIKit

import Moya
import RxCocoa
import RxSwift
import SnapKit
import Then

enum myPageAlertType {
    case signOut
    case logOut
    case select
}

final class MyPageAlertViewController: BaseViewController {
    
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components

    private let logoutAlertView = UIAlertView(frame: .zero, title: "로그아웃 하시겠습니까?", subTitle: "", alertType: .oneLine)
    private let signoutAlertView = UIAlertView(frame: .zero, title: "탈퇴하시겠습니까?", subTitle: "", alertType: .oneLine)
    private let selectInterestsAlertView = UIAlertView(frame: .zero, title: "공개 일정", subTitle: "개인 일정", alertType: .selectInterests)
    
    // MARK: - Properties
    
    private let alertType: myPageAlertType
    
    // MARK: - Initializer
    
    init(alertType: myPageAlertType){
        self.alertType = alertType
//        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindViewModel() {
        logoutAlertView.checkButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.logoutSuccess()
            }
            .disposed(by: disposeBag)
        
        logoutAlertView.cancelButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.didTapCheckButton()
            }
            .disposed(by: disposeBag)
        
        signoutAlertView.checkButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.logoutSuccess()
            }
            .disposed(by: disposeBag)
        
        signoutAlertView.cancelButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.didTapCheckButton()
            }
            .disposed(by: disposeBag)
        
        
        selectInterestsAlertView.cancelButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.didTapCheckButton()
            }
            .disposed(by: disposeBag)
    }
    
    // MARK: - UI Components Property
    
    override func setStyles() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        switch alertType {
        case .signOut:
            view.addSubviews(signoutAlertView)
            
            signoutAlertView.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 290 / 375)
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 140 / 812)
            }
        case .logOut:
            view.addSubviews(logoutAlertView)
            
            logoutAlertView.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 290 / 375)
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 140 / 812)
            }
        case .select:
            view.addSubviews(selectInterestsAlertView)
            
            selectInterestsAlertView.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
                $0.width.equalTo(SizeLiterals.Screen.screenWidth * 300 / 375)
                $0.height.equalTo(SizeLiterals.Screen.screenHeight * 330 / 812)
            }
        }
        
    }
    
    // MARK: - Methods
    
    
    
    // MARK: - @objc Methods
    
    @objc
    private func didTapCheckButton() {
        dismiss(animated: false, completion: nil)
    }
    
    @objc
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

