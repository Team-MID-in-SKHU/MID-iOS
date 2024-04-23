//
//  MonthTodoCalendarViewController.swift
//  MID
//
//  Created by 천성우 on 4/19/24.
//


import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class MonthTodoViewController: BaseViewController {
    
    private let viewModel = TodoViewModel()
    private let disposeBag = DisposeBag()
    
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var titleLabel = UILabel()
    private lazy var subTitleLabel = UILabel()
    private lazy var previousButton = UIButton()
    private lazy var nextButton = UIButton()
    private lazy var todayButton = UIButton()
    private lazy var weekStackView = UIStackView()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let calendar = Calendar.current
    private let dateFormatter = DateFormatter()
    private var calendarDate = Date()
    private var days = [String]()
    var todayDay: Int {
        let todayComponents = self.calendar.dateComponents([.year, .month, .day], from: Date())
        let selectedMonthComponents = self.calendar.dateComponents([.year, .month], from: self.calendarDate)
        
        guard let todayDate = self.calendar.date(from: todayComponents),
              let selectedMonthFirstDate = self.calendar.date(from: selectedMonthComponents) else {
            return 0
        }
        
        let todayDay = self.calendar.dateComponents([.day], from: selectedMonthFirstDate, to: todayDate).day ?? 0
        
        return todayDay
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.configure()
    }
    
    override func bindViewModel() {
        collectionView.rx.itemSelected
            .bind { [weak self] indexPath in
                guard let self else { return }
                let row = indexPath.row
                print("Selected: \(row)")
            }
            .disposed(by: disposeBag)
    }
    
    override func setStyles() {
        view.backgroundColor = .gray600
        scrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .clear
        }
        
        contentView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        titleLabel.do {
            $0.text = "이달의 일정"
            $0.font = .fontGuide(.head1)
            $0.textColor = .white000
        }
        
        subTitleLabel.do {
            $0.font = .fontGuide(.head2)
            $0.textColor = .white000
        }
        
        previousButton.do {
            $0.tintColor = .white000
            $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            $0.addTarget(self, action: #selector(self.didPreviousButtonTouched), for: .touchUpInside)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        nextButton.do {
            $0.tintColor = .white000
            $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            $0.addTarget(self, action: #selector(self.didNextButtonTouched), for: .touchUpInside)
        }

        todayButton.do {
            $0.setTitle("Today", for: .normal)
            $0.setTitleColor(.white000, for: .normal)
            $0.titleLabel?.font = .fontGuide(.detail2_reg)
            $0.backgroundColor = .gray500
            $0.layer.cornerRadius = 5
            $0.addTarget(self, action: #selector(self.didTodayButtonTouched), for: .touchUpInside)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        weekStackView.do {
            $0.distribution = .fillEqually
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        collectionView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .clear
        }
    }
    
    override func setLayout() {
        view.addSubviews(scrollView)
        scrollView.addSubviews(contentView)
        contentView.addSubviews(titleLabel, subTitleLabel, previousButton,
                                nextButton, todayButton, weekStackView, collectionView)

        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 44 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 21 / 375)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 25 / 812)
            $0.centerX.equalToSuperview()
        }
        
        previousButton.snp.makeConstraints {
            $0.trailing.equalTo(subTitleLabel.snp.leading).offset(-SizeLiterals.Screen.screenHeight * 5 / 375)
            $0.centerY.equalTo(subTitleLabel.snp.centerY)
            $0.width.height.equalTo(44)
        }
        
        nextButton.snp.makeConstraints {
            $0.leading.equalTo(subTitleLabel.snp.trailing).offset(SizeLiterals.Screen.screenWidth * 5 / 375)
            $0.centerY.equalTo(subTitleLabel.snp.centerY)
            $0.width.height.equalTo(44)
        }
        
        todayButton.snp.makeConstraints {
            $0.trailing.equalTo(contentView.snp.trailing).offset( -SizeLiterals.Screen.screenWidth * 10 / 375)
            $0.centerY.equalTo(subTitleLabel.snp.centerY)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 60 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 30 / 812)
        }
        weekStackView.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 40 / 812)
            $0.leading.equalToSuperview().offset(SizeLiterals.Screen.screenWidth * 5 / 375)
            $0.trailing.equalToSuperview().offset(-SizeLiterals.Screen.screenWidth * 5 / 375)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(weekStackView.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 10 / 812)
            $0.leading.equalTo(weekStackView.snp.leading)
            $0.trailing.equalTo(weekStackView.snp.trailing)
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.height.equalTo(contentView.snp.width).multipliedBy(1.5)
        }
    }
    
    private func configure() {
        self.configureWeekLabel()
        self.configureCalendar()
    }
    
    private func configureWeekLabel() {
        let dayOfTheWeek = ["일", "월", "화", "수", "목", "금", "토"]
        
        for i in 0..<7 {
            let label = UILabel()
            label.text = dayOfTheWeek[i]
            label.textAlignment = .center
            if label.text == "일" {
                label.textColor = .red400
            } else if label.text == "토" {
                label.textColor = .gray200
            } else {
                label.textColor = .white000

            }
            self.weekStackView.addArrangedSubview(label)
        }
    }
}

extension MonthTodoViewController {
    
    private func configureCalendar() {
        self.dateFormatter.dateFormat = "yyyy년 MM월"
        self.today()
    }
    
    private func startDayOfTheWeek() -> Int {
        return self.calendar.component(.weekday, from: self.calendarDate) - 1
    }
    
    private func endDate() -> Int {
        return self.calendar.range(of: .day, in: .month, for: self.calendarDate)?.count ?? Int()
    }
    
    private func updateCalendar() {
        self.updateTitle()
        self.updateDays()
    }
    
    private func updateTitle() {
        let date = self.dateFormatter.string(from: self.calendarDate)
        self.subTitleLabel.text = date
    }
    
    private func updateDays() {
        self.days.removeAll()
        let startDayOfTheWeek = self.startDayOfTheWeek()
        let totalDays = startDayOfTheWeek + self.endDate()
        
        for day in Int()..<totalDays {
            if day < startDayOfTheWeek {
                self.days.append(String())
                continue
            }
            self.days.append("\(day - startDayOfTheWeek + 1)")
        }
        
        self.collectionView.reloadData()
    }
    
    private func minusMonth() {
        self.calendarDate = self.calendar.date(byAdding: DateComponents(month: -1), to: self.calendarDate) ?? Date()
        self.updateCalendar()
    }
    
    private func plusMonth() {
        self.calendarDate = self.calendar.date(byAdding: DateComponents(month: 1), to: self.calendarDate) ?? Date()
        self.updateCalendar()
    }
    
    private func today() {
        let components = self.calendar.dateComponents([.year, .month], from: Date())
        self.calendarDate = self.calendar.date(from: components) ?? Date()
        self.updateCalendar()
    }
    
}

extension MonthTodoViewController {
    
    @objc private func didPreviousButtonTouched(_ sender: UIButton) {
        self.minusMonth()
    }
    
    @objc private func didNextButtonTouched(_ sender: UIButton) {
        self.plusMonth()
    }

    @objc private func didTodayButtonTouched(_ sender: UIButton) {
        self.today()
    }
}


extension MonthTodoViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.identifier, for: indexPath) as? CalendarCollectionViewCell else { return UICollectionViewCell() }
        cell.update(day: self.days[indexPath.item])
        if indexPath.item == self.todayDay {
            cell.todayDisplay()
        } else {
            cell.unTodayDisplay()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.weekStackView.frame.width / 7
        return CGSize(width: width, height: width * 1.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedDay = self.days[indexPath.item]
        print("Selected day: \(selectedDay)")
    }
}
