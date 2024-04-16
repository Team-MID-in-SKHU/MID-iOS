//
//  ImageLiterals.swift
//  MID
//
//  Created by 천성우 on 4/2/24.
//

import UIKit

enum ImageLiterals {
    enum TabBar {
        static var todo_on: UIImage { .load(name: "todo_ic_on").withRenderingMode(.alwaysOriginal) }
        static var todo_off: UIImage { .load(name: "todo_ic_off").withRenderingMode(.alwaysOriginal) }
        static var mid_on: UIImage { .load(name: "mid_ic_on").withRenderingMode(.alwaysOriginal) }
        static var mid_off: UIImage { .load(name: "mid_ic_off").withRenderingMode(.alwaysOriginal) }
        static var mypage_on: UIImage { .load(name: "mypage_ic_on").withRenderingMode(.alwaysOriginal) }
        static var mypage_off: UIImage { .load(name: "mypage_ic_off").withRenderingMode(.alwaysOriginal) }
    }
    
    enum Todo {
        static var vector: UIImage { .load(name: "Vector_ic").withRenderingMode(.alwaysOriginal)}
        static var checkBox_on: UIImage { .load(name: "CheckBox_on").withRenderingMode(.alwaysOriginal)}
        static var checkBox_off: UIImage { .load(name: "CheckBox_off").withRenderingMode(.alwaysOriginal)}
    }
    
    enum MyPage {
        static var userImage: UIImage { .load(name: "UserImage").withRenderingMode(.alwaysOriginal)}
    }
}
