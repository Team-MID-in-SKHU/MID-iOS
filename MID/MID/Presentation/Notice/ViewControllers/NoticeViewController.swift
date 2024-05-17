//
//  NoticeViewController.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class NoticeViewController: BaseViewController {
    
    
    private let viewModel = NoticeViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let searchBarView = NoticeSearchBarView()
    private let applyingView = NoticeImageView(frame: .zero, statusText: "신청중", image: ImageLiterals.MyPage.userImage, title: "프로그램 A", day: "2024년 6월 5일 마감")
    private let deadlineingView = NoticeImageView(frame: .zero, statusText: "마감임박", image: ImageLiterals.MyPage.userImage, title: "프로그램 B", day: "2024년 5월 20일 마감")
    private let moreView = MoreButtonView()
    private let 임시화면 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: - Properties
    
    override func bindViewModel() {}
    
    override func setStyles() {
        view.backgroundColor = .gray600
        
        임시화면.do {
            $0.backgroundColor = .blue
        }

    }
    
    override func setLayout() {
        view.addSubviews(searchBarView, applyingView, deadlineingView, moreView, 임시화면)
        
        searchBarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(SizeLiterals.Screen.screenHeight * 10 / 812)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 56 / 812)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth)
        }
        
        applyingView.snp.makeConstraints {
            $0.top.equalTo(searchBarView.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 5 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 12 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 224 / 812)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 171.5 / 374)
        }
        
        deadlineingView.snp.makeConstraints {
            $0.top.equalTo(searchBarView.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 5 / 812)
            $0.trailing.equalToSuperview().offset(-SizeLiterals.Screen.screenWidth * 12 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 224 / 812)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 171.5 / 374)
        }
        
        moreView.snp.makeConstraints {
            $0.top.equalTo(applyingView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 40 / 812)
        }
        
        임시화면.snp.makeConstraints {
            $0.top.equalTo(moreView.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 12 / 812)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 180 / 812)
        }
    }
    
    override func setRegister() {}
    

}
