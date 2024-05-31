//
//  DetailsNoticeViewController.swift
//  MID
//
//  Created by 천성우 on 5/24/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class DetailsNoticeViewController: BaseViewController {
    
    
    private let viewModel: NoticeViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    
    // MARK: - Properties

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(viewModel: NoticeViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func bindViewModel() {}
    
    override func setStyles() {
        view.backgroundColor = .gray600
    }
    
    override func setLayout() {}
    
    override func setRegister() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
