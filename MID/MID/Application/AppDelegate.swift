//
//  AppDelegate.swift
//  MID
//
//  Created by 천성우 on 4/2/24.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       requestAuthorizationForRemotePushNotification()
       return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
    // 푸시 알림 권한 요청 메서드
    func requestAuthorizationForRemotePushNotification() {
        let current = UNUserNotificationCenter.current()
        current.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            // granted가 true로 떨어지면 푸시를 받을 수 있습닏.
        }
    }
}

