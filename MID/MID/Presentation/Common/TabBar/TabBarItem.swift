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
            return ImageLiterals.TabBar.home
        case .actionList:
            return ImageLiterals.TabBar.home
        case .myPage:
            return ImageLiterals.TabBar.home
        }
    }
    
    var selectedIcon: UIImage {
        switch self {
        case .home:
            return ImageLiterals.TabBar.home
        case .actionList:
            return ImageLiterals.TabBar.home
        case .myPage:
            return ImageLiterals.TabBar.home
        }
    }
    
    func setTabBarItem() -> UITabBarItem {
        return UITabBarItem(title: "", image: unSelectedIcon, selectedImage: selectedIcon)
    }
}
