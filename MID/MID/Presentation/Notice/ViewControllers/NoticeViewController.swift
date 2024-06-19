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
    private let applyingView = NoticeImageView(frame: .zero, statusText: "신청중", image: ImageLiterals.codingImage, title: "대학생 코딩 캠프 17기", day: "2024년 6월 31일 마감")
    private let deadlineingView = NoticeImageView(frame: .zero, statusText: "마감임박", image: ImageLiterals.jetiImage, title: "시험기간 제티 요정 모집", day: "2024년 6월 21일 마감")
    private let moreView = MoreButtonView()
    private let noticeTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: - Properties
    
    override func bindViewModel() {
        
        searchBarView.searchButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                let searchText = self.searchBarView.searchTextField.text ?? ""
                self.viewModel.inputs.didTapSearchButton(title: searchText)
            }
            .disposed(by: disposeBag)
        
        viewModel.outputs.noticeList
            .bind(to: noticeTableView.rx.items(cellIdentifier: NoticeTableViewCell.className, cellType: NoticeTableViewCell.self)) { row, data, cell in
                cell.configureWith(data: data)
            }
            .disposed(by: disposeBag)

    }
    
    override func setStyles() {
        view.backgroundColor = .gray600
        
        noticeTableView.do {
            $0.rowHeight = SizeLiterals.Screen.screenHeight * 52 / 812
            $0.bounces = true
            $0.backgroundColor = .clear
            $0.separatorColor = .clear
            $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            $0.contentInset = .zero
            $0.isScrollEnabled = false
        }

    }
    
    override func setLayout() {
        view.addSubviews(searchBarView, applyingView, deadlineingView, moreView, noticeTableView)
        
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
        
        noticeTableView.snp.makeConstraints {
            $0.top.equalTo(moreView.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 12 / 812)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 180 / 812)
        }
    }
    
    override func setRegister() {
        noticeTableView.register(NoticeTableViewCell.self, forCellReuseIdentifier: NoticeTableViewCell.className)
    }
    

}
