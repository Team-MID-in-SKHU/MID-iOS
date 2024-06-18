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
                let userName = self.signUpThirdPage.nameTextField.text ?? ""
                let userPhoneNumber = self.signUpThirdPage.phoneNumberTextField.text ?? ""
                let userRole = self.signUpThirdPage.studentRoleTextField.text == "일반학생" ? "STUDENT" : "ADMIN"
                let userDepartment = self.signUpThirdPage.studentDepartmentTextField.text ?? ""
                
                self.viewModel.inputs.didTapSignUpThirdPage(name: userName, department: userDepartment, phoneNumber: userPhoneNumber, fcmToken: "", roleType: userRole)
            }
            .disposed(by: disposeBag)
        
        viewModel.outputs.signUpBool
            .bind(onNext: { [weak self] index in
                if index == 1 {
                    self?.signUpSuccpuess()
                } else if index == 0 {
                    self?.signUpFail()
                }
            })
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
    
    private func signUpFail() {
        let finishedAlertView = AuthAlertViewController(alertType: .failSignUp, viewModel: self.viewModel)
        finishedAlertView.modalPresentationStyle = .overFullScreen
        self.present(finishedAlertView, animated: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


