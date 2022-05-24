//
//  AppDelegate.swift
//  CustomDarkMode
//
//  Created by liangdahong on 05/24/2022.
//  Copyright (c) 2022 liangdahong. All rights reserved.
//

import UIKit
import CustomTheme

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        DarkModeManager.shared.currentMode = .light
        CustomThemeService.refresh()
    }
}

