//
//  LoginViewController.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class LoginViewController: BaseViewController {

    
    private let viewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let loginView = LoginView()

    // MARK: - Properties

    // MARK: - Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Config.baseURL)
    }
    
    override func bindViewModel() {
        loginView.signInButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                let username = self.loginView.idField.text ?? ""
                let password = self.loginView.pwField.text ?? ""
                print(username)
                print(password)
                self.viewModel.inputs.didTapLoginButton(id: username, pw: password)
            }
            .disposed(by: disposeBag)
        
        loginView.signUpButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.pushToSignUpViewController()
            }
            .disposed(by: disposeBag)
        
        viewModel.outputs.loginBool
            .bind(onNext: { [weak self] index in
                if index == 1 {
                    self?.loginSuccess()
                } else if index == 0 {
                    self?.loginFail()
                }
            })
            .disposed(by: disposeBag)
    }
    
    override func setStyles() {
        view.backgroundColor = .gray600
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .white000
    }
    
    override func setLayout() {
        view.addSubviews(loginView)
        
        loginView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func loginSuccess() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            let vc = TabBarController()
            vc.selectedIndex = 0
            let rootVC = UINavigationController(rootViewController: vc)
            rootVC.navigationController?.isNavigationBarHidden = true
            window.rootViewController = rootVC
            window.makeKeyAndVisible()
        }
    }
    
    
    private func pushToSignUpViewController() {
        let vc = SignUpViewController(viewModel: self.viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func loginFail() {
        let finishedAlertView = MyPageAlertViewController(alertType: .failLogin)
        finishedAlertView.modalPresentationStyle = .overFullScreen
        self.present(finishedAlertView, animated: false)
    }
}


