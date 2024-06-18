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
    private let viewModel: MyPageViewModel
    
    // MARK: - UI Components

    private let logoutAlertView = UIAlertView(frame: .zero, title: "로그아웃 하시겠습니까?", subTitle: "", alertType: .oneLine)
    private let signoutAlertView = UIAlertView(frame: .zero, title: "탈퇴하시겠습니까?", subTitle: "", alertType: .oneLine)
    private let selectInterestsAlertView = UIAlertView(frame: .zero, title: "공개 일정", subTitle: "개인 일정", alertType: .selectInterests)
    
    // MARK: - Properties
    
    private let alertType: myPageAlertType
    var dataList: UserInterestUpDateBody = UserInterestUpDateBody.userInterestDummy()
    
    // MARK: - Initializer
    
    init(alertType: myPageAlertType, viewModel: MyPageViewModel){
        self.alertType = alertType
        self.viewModel = viewModel
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
                viewModel.inputs.logOutDidTap()
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
                viewModel.inputs.withdrawalDidTap()
            }
            .disposed(by: disposeBag)
        
        signoutAlertView.cancelButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.didTapCheckButton()
            }
            .disposed(by: disposeBag)
        
        selectInterestsAlertView.checkButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                sendData()
                self.viewModel.inputs.interestModifyDidTap(userData: self.dataList)
            }
            .disposed(by: disposeBag)
        
        
        selectInterestsAlertView.cancelButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                self.didTapCheckButton()
            }
            .disposed(by: disposeBag)
        
        viewModel.outputs.logOutBool
            .bind(onNext: { [weak self] index in
                if index == 1 {
                    self?.logoutSuccess()
                } else if index == 0 {
                    print("예상치 못한 오류 발생")
                }
            })
            .disposed(by: disposeBag)
        viewModel.outputs.interestBool
            .bind(onNext: { [weak self] index in
                if index == 1 {
                    self?.didTapCheckButton()
                } else if index == 0 {
                    print("예상치 못한 오류 발생")
                }
            })
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
    
    
    func sendData() {

        if selectInterestsAlertView.academicButton.buttonStatus {
            if !dataList.interestCategoryList.contains("ACADEMIC_SCHEDULE") {
                dataList.interestCategoryList.append("ACADEMIC_SCHEDULE")
            }
        } else {
            dataList.interestCategoryList.removeAll { $0 == "ACADEMIC_SCHEDULE" }
        }

        if selectInterestsAlertView.studentCouncilButton.buttonStatus {
            if !dataList.interestCategoryList.contains("STUDENT_COUNCIL_SCHEDULE") {
                dataList.interestCategoryList.append("STUDENT_COUNCIL_SCHEDULE")
            }
        } else {
            dataList.interestCategoryList.removeAll { $0 == "STUDENT_COUNCIL_SCHEDULE" }
        }
        
        if selectInterestsAlertView.clubButton.buttonStatus {
            if !dataList.interestCategoryList.contains("CLUB_SCHEDULE") {
                dataList.interestCategoryList.append("CLUB_SCHEDULE")
            }
        } else {
            dataList.interestCategoryList.removeAll { $0 == "CLUB_SCHEDULE" }
        }
        
        if selectInterestsAlertView.smallGatheringButton.buttonStatus {
            if !dataList.interestCategoryList.contains("SMALL_GROUP") {
                dataList.interestCategoryList.append("SMALL_GROUP")
            }
        } else {
            dataList.interestCategoryList.removeAll { $0 == "SMALL_GROUP" }
        }
        
        if selectInterestsAlertView.semiClubButton.buttonStatus {
            if !dataList.interestCategoryList.contains("PRE_CLUB") {
                dataList.interestCategoryList.append("PRE_CLUB")
            }
        } else {
            dataList.interestCategoryList.removeAll { $0 == "PRE_CLUB" }
        }
        
        if selectInterestsAlertView.outsideClubButton.buttonStatus {
            if !dataList.interestCategoryList.contains("EXTERNAL_CLUB") {
                dataList.interestCategoryList.append("EXTERNAL_CLUB")
            }
        } else {
            dataList.interestCategoryList.removeAll { $0 == "EXTERNAL_CLUB" }
        }
    }

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

