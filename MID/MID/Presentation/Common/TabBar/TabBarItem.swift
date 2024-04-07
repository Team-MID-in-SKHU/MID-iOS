//
//  TabBarItem.swift
//  MID
//
//  Created by 천성우 on 4/2/24.
//

import UIKit

enum TabBarItemType: Int, CaseIterable {
    case home
    case actionList
    case myPage
}

extension TabBarItemType {
    
    var unSelectedIcon: UIImage {
        switch self {
        case .home:
            return ImageLiterals.TabBar.todo_off
        case .actionList:
            return ImageLiterals.TabBar.mid_off
        case .myPage:
            return ImageLiterals.TabBar.mypage_off
        }
    }
    
    var selectedIcon: UIImage {
        switch self {
        case .home:
            return ImageLiterals.TabBar.todo_on
        case .actionList:
            return ImageLiterals.TabBar.mid_on
        case .myPage:
            return ImageLiterals.TabBar.mypage_on
        }
    }
    
    func setTabBarItem() -> UITabBarItem {
        return UITabBarItem(title: "", image: unSelectedIcon, selectedImage: selectedIcon)
    }
}
