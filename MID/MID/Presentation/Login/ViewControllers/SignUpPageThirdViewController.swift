//
//  SignUpPageThirdViewController.swift
//  MID
//
//  Created by 천성우 on 5/15/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class SignUpPageThirdViewController: BaseViewController {
    
    
    private let viewModel: LoginViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private lazy var scrollView = UIScrollView()
    private let signUpThirdPage = SignUpThirdPageView()
    
    // MARK: - Properties
    
    
    // MARK: - Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(viewModel: LoginViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func bindViewModel() {
        signUpThirdPage.nextButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.signUpSuccpuess()
            }
            .disposed(by: disposeBag)

    }
    
    override func setStyles() {
        view.backgroundColor = .gray600
        
        scrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .clear
        }
    }
    
    override func setLayout() {
        view.addSubviews(signUpThirdPage)
        
        signUpThirdPage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func signUpSuccpuess() {
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


