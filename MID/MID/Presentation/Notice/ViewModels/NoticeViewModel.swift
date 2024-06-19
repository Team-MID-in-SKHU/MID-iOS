//
//  NoticeViewModel.swift
//  MID
//
//  Created by 천성우 on 4/5/24.
//

import UIKit

import RxCocoa
import RxSwift

protocol NoticeViewModelInput {
    func didTapSearchButton(title: String)
}

protocol NoticeViewModelOutput {
    var noticeList: BehaviorRelay<[NoticeListResponseBody]> { get }
}

protocol NoticeViewModelType {
    var inputs: NoticeViewModelInput { get }
    var outputs: NoticeViewModelOutput { get }
}

final class NoticeViewModel: NoticeViewModelInput, NoticeViewModelOutput, NoticeViewModelType {
    
    var noticeList: BehaviorRelay<[NoticeListResponseBody]> = BehaviorRelay(value: NoticeListResponseBody.noticeDummy())
    
    private let noticeListDumy: [NoticeListResponseBody] = [
        NoticeListResponseBody(title: "시험기간 제티 요정 모집", subTitle: "2024년 6월 14일시작"),
        NoticeListResponseBody(title: "대학생 코딩 캠프 17기", subTitle: "2024년 7월 1일 시작"),
        NoticeListResponseBody(title: "SOPT APPJAM", subTitle: "2024년 6월 29일 시작"),
        NoticeListResponseBody(title: "대학생 농촌봉사활동", subTitle: "2024년 7월 14일 시작"),
    ]
    
    private let disposeBag = DisposeBag()

    
    var inputs: NoticeViewModelInput { return self }
    var outputs: NoticeViewModelOutput { return self }
    

    init() {
        noticeList.accept(noticeListDumy)
    }

    func didTapSearchButton(title: String) {
        if title.isEmpty {
            noticeList.accept(noticeListDumy)
        } else {
            let filteredNotices = noticeListDumy.filter { $0.title.contains(title) }
            noticeList.accept(filteredNotices)
        }
    }
    
}

extension NoticeViewModel {
    func getSearchEvent(title: EventSearchRequestBody) {
        EventService.getSearchEvent(title: title)
            .subscribe(onNext: { [weak self] data in
                self?.noticeList.accept([data])
            }, onError: { [weak self] error in
                guard let self else { return }
                print(error)
            })
            .disposed(by: disposeBag)
    }
    
    func delImage(id: String) {
        EventService.delImage(id: id)
            .subscribe(onNext: { [weak self] data in
                guard let self else { return }
                print("이미지가 삭제 되었습니다.")
            }, onError: { [weak self] error in
                guard let self else { return }
                print(error)
            })
            .disposed(by: disposeBag)
    }
    
    func getEventDisplay() {
        EventService.getEventDisplay()
            .subscribe(onNext: { [weak self] data in
                guard let self else { return }
                print("이벤트 조회가 완료되었습니다.")
            }, onError: { [weak self] error in
                guard let self else { return }
                print(error)
            })
            .disposed(by: disposeBag)
    }
    
    func getRandomEvent() {
        EventService.getRandomEvent()
            .subscribe(onNext: { [weak self] data in
                guard let self else { return }
                print("랜덤 이벤트 조회가 완료되었습니다.")
            }, onError: { [weak self] error in
                guard let self else { return }
                print(error)
            })
            .disposed(by: disposeBag)
    }
}


struct NoticeListResponseBody: Codable {
    let title: String, subTitle: String
}

extension NoticeListResponseBody {
    static func noticeDummy() -> [NoticeListResponseBody] {
        return [NoticeListResponseBody(title: "", subTitle: "")]
    }
}
