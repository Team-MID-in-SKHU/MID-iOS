//
//  LaterTodoModel.swift
//  MID
//
//  Created by 천성우 on 4/15/24.
//

import Foundation

struct TodoItem {
    let title: String
    let todoCheck: Bool
}

struct DayTodo {
    let date: String
    let day: String
    var todos: [TodoItem]
}

struct dummyLaterTodoData {
    let todoItems1: [TodoItem]
    let todoItems2: [TodoItem]
    let date1: String
    let date2: String

    var dayTodo1: DayTodo {
        return DayTodo(date: date1, day: "화요일", todos: todoItems1)
    }

    var dayTodo2: DayTodo {
        return DayTodo(date: date2, day: "수요일", todos: todoItems2)
    }

    // DayTodo 배열을 반환하는 연산 프로퍼티
    var todos: [DayTodo] {
        return [dayTodo1, dayTodo2]
    }

    init() {
        todoItems1 = [
            TodoItem(title: "Swift 공부하기", todoCheck: true),
            TodoItem(title: "iOS 앱 개발 블로그 읽기", todoCheck: false),
            TodoItem(title: "운동하기", todoCheck: false)
        ]

        todoItems2 = [
            TodoItem(title: "책 읽기", todoCheck: true),
            TodoItem(title: "반려동물 산책시키기", todoCheck: true),
            TodoItem(title: "프로젝트 회의 준비", todoCheck: false)
        ]

        date1 = "10"
        date2 = "12"
    }
}




